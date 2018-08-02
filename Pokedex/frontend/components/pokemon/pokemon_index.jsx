//mounts, renders (w empty state), componnentDM, AJAX call to retrieve data, .then triggers action, reducer updates store, container mSTP new state to props, new props trigger rerender w/ new data

import React from 'react';
import PokemonIndexItem from './pokemon_index_item';

// const pokemonItems = this.props.

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
      <section className="pokedex">
        <ul>
          {pokemon.map(poke => <PokemonIndexItem key={poke.id} pokemon={poke} />)}
        </ul>
      </section>
    );
  }
}


export default PokemonIndex;
