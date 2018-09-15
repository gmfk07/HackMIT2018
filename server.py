# -*- coding: utf-8 -*-
"""
Created on Sat Sep 15 11:26:48 2018

@author: gmfk07
"""

from flask import Flask, request, jsonify, session
from flask_socketio import SocketIO, join_room, leave_room, emit
from words import adjective_set, noun_set
import random

app = Flask(__name__)
socketio = SocketIO(app)
current_lobbies = set()
players_in_lobbies = {}
players_to_nums = {}

@socketio.on('join')
def on_join(rm):
    if rm in current_lobbies:
        join_room(rm)
        player_num = players_in_lobbies[rm] + 1
        players_in_lobbies[rm] = player_num
        players_to_nums[request.sid] = player_num
        emit('join response', {'data': player_num})
        emit('player join', {'player': player_num})
    else:
        emit('join failed', {'data': 'Room does not exist'})

@socketio.on('leave')
def on_leave(rm):
    room = rm
    leave_room(room)
    del players_to_nums[request.sid]
    
@socketio.on('connect')
def test_connect():
    emit('connect response', {'data': 'Connected'})
    print('Client connected')

@socketio.on('disconnect')
def test_disconnect():
    print('Client disconnected')
    
@socketio.on('button press')
def button_press(button):
    player_num = players_to_nums[request.sid]
    emit('button press', player_num + "|" + button, room=session.get("room") + " GAME")
    
@socketio.on('joystick')
def joystick(data):
    player_num = players_to_nums[request.sid]
    emit('joystick', str(player_num) + "|" + str(data['angle']) + "|" + \
         str(data['dist']), room=session.get("room") + " GAME")
    
@socketio.on('game')
def new_game(message):
    code = generate_code()
    current_lobbies.add(code)
    players_in_lobbies[code] = 0
    emit('new game', code)
    room = code + " GAME"
    join_room(room)

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