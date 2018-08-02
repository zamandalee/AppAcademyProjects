//mounts, renders (w empty state), componnentDM, AJAX call to retrieve data, .then triggers action, reducer updates store, container mSTP new state to props, new props trigger rerender w/ new data

import React from 'react';

const Pokemon = (props) => (
  <li className="pokemon">
    <img src={props.poke.image_url}></img>
    {props.poke.name}
  </li>
);

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon(); //invoke the prop from mDTP, cause dispatch
  }

  render() {
    const { pokemon }= this.props;
    return (
      <ul>
        {pokemon.map( poke => (
          <Pokemon poke={poke} key={poke.id}/>
        ))}
      </ul>
    );
  }
}


export default PokemonIndex;
