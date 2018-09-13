import React from 'react';
import requestSinglePokemon from '../../actions/pokemon_actions';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }

  componentWillReceiveProps(newProps) {
    if (this.props.match.params.pokemonId !== newProps.match.params.pokemonId) {
      this.props.requestSinglePokemon(newProps.match.params.pokemonId);
    }
  }

  render() {
    if (!this.props.pokemon) return null;
    const { pokemon } = this.props;
    return (
      <section>
        <div>
          <img src={pokemon.image_url}></img>
          <h2>{pokemon.name}</h2>
          <p>Type: {pokemon.poke_type}</p>
          <p>Attack: {pokemon.attack}</p>
          <p>Defense: {pokemon.defense}</p>
          <p>Moves: {pokemon.moves}</p>
        </div>
        <div>
          Items

        </div>
      </section>
    );
  }
}

export default PokemonDetail;
