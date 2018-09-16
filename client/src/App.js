import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import './Controller.css';
import io from 'socket.io-client';
import JoyStick from 'react-joystick';

const socket = io('http://localhost:5000', {reconnect: true});


const joyOptions = {
    mode: 'dynamic',
    catchDistance: 125,
    color: 'white',
    zone: document.getElementById('controllerLeft'),
    position: {left: '50%', top: '50%'}
}

const containerStyle = {
    position: 'relative',
    height: '250px',
    width: '250px',
    backgroundColor: '#E6E6E6',
    borderRadius: '100%'
}

class LobbyScreen extends Component {
  render() {
    return ("You're in! Waiting for game start...");
  }
}

class JoyWrapper extends Component {
    constructor() {
        super();
        this.state = {stickCanEmit: true};
        this.managerListener = this.managerListener.bind(this);
        this.allowStickEmit = this.allowStickEmit.bind(this);
    }

    managerListener(manager) {
        manager.on('move', (e, stick) => {
          if (stickCanEmit)
          {
            console.log(stick);
            socket.emit('joystick', {'angle': Math.round(stick.angle.degree), 'distance': Math.round(stick.distance)});
            this.setState(stickCanEmit, false);
            setTimeout(allowStickEmit, 150);

          }
        })
        manager.on('end', () => {
            console.log('I ended!')
            socket.emit('joystick', {'angle': 0, 'distance': 0})
        })
    }

    allowStickEmit() {
      this.setState({stickCanEmit: true});
    }

    render() {
        const { classes } = this.props;
        return (
            <div>
                <JoyStick joyOptions={joyOptions} containerStyle={containerStyle} managerListener={this.managerListener} />
            </div>
        )

    }
}

class Controller extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    window.addEventListener('devicemotion', function(event) {
      socket.emit('device acceleration', {'x': event.acceleration.x,
      'y': event.acceleration.y, 'z': event.acceleration.z});
    });
  }

  handleClickCL1() {
    socket.emit('button press', 'green');
  }

  handleClickCR1() {
    socket.emit('button press', 'blue');
  }

  handleClickCL2() {
    socket.emit('button press', 'yellow');
  }

  handleClickCR2() {
    socket.emit('button press', 'red');
  }

  render()
  {
    return (
<div id="container">
<div class="cable"></div>
<div class="controller">

  <div class="centerBlue">
    <div class="centerLeft"></div>
    <div class="centerRight"></div>
  </div>
  <div class="centerStart">
    <div class="SLeft"></div>
    <div class="SRight"></div>
  </div>
  <div class="centerSelect">
    <div class="SLeft"></div>
    <div class="SRight"></div>
  </div>

  <div class="controllerLeft">
    <JoyWrapper/>
  </div>
  <div class="controllerRight">
    <div class="backButton1Center">
      <div class= "cornerLeft1" onClick={this.handleClickCL1}></div>
      <div class= "cornerRight1" onClick={this.handleClickCR1}></div>
    </div>
    <div class="backButton2Center">
      <div class= "cornerLeft2" onClick={this.handleClickCL2}></div>
      <div class= "cornerRight2" onClick={this.handleClickCR2}></div>
    </div>
  </div>
</div>
</div>
    );
  }
}

class EnterCode extends React.Component {
  constructor(props) {
    super(props);
    this.state = {roomCode: "", name: ""};
    this.handleRoomChange = this.handleRoomChange.bind(this);
    this.handleNameChange = this.handleNameChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentDidMount() {
    socket.on('connect response', function(socket) {
      console.log('Connected!');
    });
    window.addEventListener('devicemotion', function(event) {
      console.log(event.acceleration.x + ' m/s2');
    });
  }

  handleRoomChange(e) {
    this.setState({roomCode: e.target.value.toLowerCase()});
  }

  handleNameChange(e) {
    this.setState({name: e.target.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    if (this.state.name != "" && this.state.name.length <= 24)
      socket.emit('join', {"room": this.state.roomCode, "name": this.state.name});
  }

  render()
  {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>
          Name:
          <input type="text" value={this.state.name} onChange={this.handleNameChange} />
          <br/>
          Room Code:
          <input type="text" value={this.state.roomCode} onChange={this.handleRoomChange} />
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
    this.state = {stage: 0}
    this.advanceGame = this.advanceGame.bind(this);
  }

  componentDidMount()
  {
    socket.on('game closed', (payload) => {
      window.location.reload();
    });
    socket.on('join response', (payload) => {
      this.advanceGame();
    });
    socket.on('game start', (payload) => {
      this.advanceGame();
    });
  }

  advanceGame()
  {
    this.setState({stage: this.state.stage+1});
  }

  render() {
    var stage = this.state.stage;
    function getComponent()
    {
      switch (stage)
      {
        case 0: return <EnterCode/>; break;
        case 1: return <LobbyScreen/>; break;
        case 2: return <Controller/>; break;
      }
    }
    return (
      <div className="App">
        {getComponent()}
      </div>
    );
  }
}

export default App;
