# -*- coding: utf-8 -*-
"""
Created on Sat Sep 15 11:26:48 2018

@author: gmfk07
"""

from flask import Flask, request, jsonify, session
from flask_socketio import SocketIO, join_room, leave_room, emit, rooms
from words import adjective_set, noun_set
import random

app = Flask(__name__)
socketio = SocketIO(app)
current_lobbies = set()
players_in_lobbies = {}
player_names = {}

@socketio.on('join')
def on_join(data):
    if data["room"] in current_lobbies:
        rm = data["room"]
        join_room(rm)
        players_in_lobbies[rm] += 1
        player_names[request.sid] = data["name"]
        emit('join response', {'name': data['name']})
        emit('player join', data["name"], room=rm + " GAME")
    else:
        emit('join failed', {'data': 'Room does not exist'})

@socketio.on('leave')
def on_leave(rm):
    room = rm
    leave_room(room)
    del player_names[request.sid]
    
@socketio.on('connect')
def test_connect():
    emit('connect response', {'data': 'Connected'})
    print('Client connected')

@socketio.on('disconnect')
def test_disconnect():
    if (rooms[1]("room")[-4:] == "GAME"):
        emit('game closed', 'E', room=rooms[1][:-5])
    else:
        emit('player leave', 'E', room=rooms[1] + " GAME")
        leave_room(rooms[1])
    print('Client disconnected')
    
@socketio.on('button press')
def button_press(button):
    player_name = player_names[request.sid]
    emit('button press', player_name + "|" + button, room=rooms[1] + " GAME")
    
@socketio.on('joystick')
def joystick(data):
    player_name = player_names[request.sid]
    emit('joystick', player_name + "|" + str(data['angle']) + "|" + \
         str(data['dist']), room=rooms[1] + " GAME")
    
@socketio.on('game')
def new_game(message):
    code = generate_code()
    current_lobbies.add(code)
    players_in_lobbies[code] = 0
    emit('new game', code)
    room = code + " GAME"
    join_room(room)
    
@socketio.on('game start')
def game_start(message):
    if (rooms[1][-4:] == "GAME"):
        emit('game start', 'E', room=rooms[1][:-5])

def post(data, code=200):
    resp = jsonify(data)
    resp.status_code = code
    return resp

def generate_code():
    while True:
        current_adj = random.sample(adjective_set, 1)[0]
        current_noun = random.sample(noun_set, 1)[0]
        current_code = current_adj + " " + current_noun
        if (current_code not in current_lobbies):
            return current_code