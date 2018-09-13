import { RECEIVE_POKEMON_DETAIL } from '../actions/pokemon_actions';
import { merge } from 'lodash';

const itemsReducer = (state={}, action) => {
  Object.freeze(state);
  let newState = merge({}, state);

  switch (action.type) {
    case RECEIVE_POKEMON_DETAIL:
      return action.payload.items;
    default:
      return state;
  }
};

export default itemsReducer;
