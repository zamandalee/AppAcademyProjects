import { connect } from 'react-redux';
import { requestAllPokemon } from '../../actions/pokemon_actions';
import { selectAllPokemon } from '../../reducers/selectors';
import PokemonIndex from './pokemon_index';

const mapStateToProps = (state) => ({
  pokemon: selectAllPokemon(state)
});

const mapDispatchToProps = (dispatch) => ({
  //want to pass as arrow function so we can deliberately invoke in component
  requestAllPokemon: () => dispatch(requestAllPokemon())
});

export default connect(mapStateToProps, mapDispatchToProps)(PokemonIndex);
