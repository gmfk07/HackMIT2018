import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import './Controller.css';
import io from 'socket.io-client';
import JoyStick from 'react-joystick';

const socket = io('http://localhost:5000/test', {reconnect: true});

 
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
