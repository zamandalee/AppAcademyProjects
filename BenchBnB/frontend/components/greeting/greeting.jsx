import React from 'react';
import { Link } from 'react-router-dom';

const Greeting = (props) => {
  if(props.currentUser) {
    return (<div>
      <h2>Welcome to BenchBnB, {props.currentUser}</h2>
      <button onClick={() => props.logout()}>Logout</button>
    </div>);
  } else {
    return (<div>
      <Link to='/signup'>Signup</Link>
      <Link to='/login'>Login</Link>
    </div>);
  }
};

export default Greeting;
