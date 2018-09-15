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
 
 
class JoyWrapper extends Component {
    constructor() {
        super();
        this.managerListener = this.managerListener.bind(this);
    }
 
    managerListener(manager) {
        manager.on('move', (e, stick) => {
            console.log(stick);
        })
        manager.on('end', () => {
            console.log('I ended!')
        })
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
    socket.emit('join', 'main');
  }

  handleClickCL1() {
    alert("green button clicked");
  }

  handleClickCR1() {
    alert("blue button clicked");
  }

  handleClickCL2() {
    alert("yellow button clicked");
  }

  handleClickCR2() {
    alert("red button clicked");
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
