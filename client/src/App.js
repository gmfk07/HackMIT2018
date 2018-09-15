import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import io from 'socket.io-client';

const socket = io('http://localhost:5000', {reconnect: true});

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

class EnterCode extends React.Component {
  constructor(props) {
    super(props);
    this.state = {roomCode: ""};
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentDidMount() {
    socket.on('join response', (payload) => {
      this.props.startGame();
    });
    socket.on('connect response', function(socket) {
      console.log('Connected!');
    });
  }

  handleChange(e) {
    this.setState({roomCode: e.target.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    socket.emit('join', this.state.roomCode);
  }

  render()
  {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>
          Room Code:
          <input type="text" value={this.state.roomCode} onChange={this.handleChange} />
        </label>
        <input type="submit" value="Submit" onClick={this.handleSubmit} />
      </form>
    );
  }
}

class App extends Component {
  constructor()
  {
    super();
    this.state = {inGame: false}
    this.startGame = this.startGame.bind(this);
  }

  startGame()
  {
    this.setState({inGame: true});
  }

  render() {
    return (
      <div className="App">
        {this.state.inGame ? <Controller/>:<EnterCode startGame={this.startGame}/>}
      </div>
    );
  }
}

export default App;
