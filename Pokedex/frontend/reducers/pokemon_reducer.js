import { RECEIVE_ALL_POKEMON, RECEIVE_POKEMON_DETAIL } from '../actions/pokemon_actions';
import {merge} from 'lodash';

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  let newState = merge({}, state);
  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      return merge({}, state, action.pokemon);
    case RECEIVE_POKEMON_DETAIL:
      newState[action.payload.pokemon.id] = action.payload.pokemon;
      return newState;
    default:
      return state;
  }
};

export default pokemonReducer;
