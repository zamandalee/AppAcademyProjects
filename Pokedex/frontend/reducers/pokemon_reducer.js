import { RECEIVE_ALL_POKEMON } from '../actions/pokemon_actions';
import {merge} from 'lodash';

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  let newState = merge({}, state);
  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      return action.pokemon;
    default:
      return state;
  }
};

export default pokemonReducer;
