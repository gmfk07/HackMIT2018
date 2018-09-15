# -*- coding: utf-8 -*-
"""
Created on Sat Sep 15 11:26:48 2018

@author: gmfk07
"""

from flask import Flask, request
from flask_socketio import SocketIO, join_room, leave_room, emit

app = Flask(__name__)
socketio = SocketIO(app)

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
    
