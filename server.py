# -*- coding: utf-8 -*-
"""
Created on Sat Sep 15 11:26:48 2018

@author: gmfk07
"""

from flask import Flask, request, jsonify
from flask_socketio import SocketIO, join_room, leave_room, emit
from words import adjective_set, noun_set
import random

app = Flask(__name__)
socketio = SocketIO(app)
current_lobbies = set()
players_in_lobbies = {}

@socketio.on('join', namespace='/game')
def on_join(rm):
    if rm in current_lobbies:
        join_room(rm)
        players_in_lobbies[rm] += 1
        emit('join response', {'data': 'Joined'})
    else:
        emit('join failed', {'data': 'Room does not exist'})

@socketio.on('leave', namespace='/game')
def on_leave(rm):
    room = rm
    leave_room(room)
    
@socketio.on('connect', namespace='/game')
def test_connect():
    emit('connect response', {'data': 'Connected'})
    print('Client connected')

@socketio.on('disconnect', namespace='/game')
def test_disconnect():
    print('Client disconnected')
    
@socketio.on('game', namespace='/game')
def new_game(message):
    code = generate_code()
    current_lobbies.add(code)
    players_in_lobbies[code] = 0
    emit('new game', {"code": code})
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