import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import io from 'socket.io-client';

const socket = io('http://localhost:5000/test', {reconnect: true});

class Controller extends React.Component {
  constructor(props) {
    super(props);
    socket.emit('join', 'main');
  }

  render()
  {
    return (null);
  }
}

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Welcome to React</h1>
        </header>
        <p className="App-intro">
          To get started, edit <code>src/App.js</code> and save to reload.
        </p>
        <Controller/>
      </div>
    );
  }
}

export default App;
