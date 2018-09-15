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
currentLobbies = set()

@socketio.on('join', namespace='/game')
def on_join(rm):
    join_room(rm)

@socketio.on('leave', namespace='/game')
def on_leave(rm):
    room = rm
    leave_room(room)
    
@socketio.on('connect', namespace='/server')
def test_connect():
    emit('connect response', {'data': 'Connected'})
    print('Client connected')

@socketio.on('disconnect', namespace='/server')
def test_disconnect():
    print('Client disconnected')

def post(data, code=200):
    resp = jsonify(data)
    resp.status_code = code
    resp.headers['Link'] = 'http://build-it-yourself.com'
    return resp

def generate_code():
    while True:
        current_adj = random.sample(adjective_set, 1)[0]
        current_noun = random.sample(noun_set, 1)[0]
        current_code = current_adj + " " + current_noun
        if (current_code not in currentLobbies):
            return current_code
        
    
@app.route('/lobby', methods=["CONNECT"])
def login():
    #Adding users
    if request.method == "CONNECT":
        if "game" in request.args: 
            code = generate_code()
            currentLobbies.add(code)
            return post({"code": code})