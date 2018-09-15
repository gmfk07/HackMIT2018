import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import './Controller.css';
import io from 'socket.io-client';

const socket = io('http://localhost:5000/test', {reconnect: true});

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
<div>
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
    <div class="circle"></div>
    <div class="crossCenter">
      <div class="crossTop"></div>
      <div class="crossBottom"></div>
      <div class="crossLeft"></div>
      <div class="crossRight"></div>
      <div class="crossCircle"></div>
    </div>
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
