import React from 'react';

class Clock extends React.Component {
  constructor(prop) {
    super(prop);

    this.state = {
      time: new Date()
    };
    this.tick = this.tick.bind(this);
  }

  componentDidMount() {
    this.interval = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.interval);
  }

  render() {
    return (
      <div className="clock">
        <h1>Clock</h1>
        <div className = "clock-contents">
          <p className="clock-title"><strong>Time:</strong>{this.state.time.toTimeString()}</p>
          <p className="clock-title"><strong>Date:</strong>{this.state.time.toDateString()}</p>
        </div>
      </div>
    );
  }

  tick() {
    this.setState( {time: new Date()} );
  }
}

export default Clock;
