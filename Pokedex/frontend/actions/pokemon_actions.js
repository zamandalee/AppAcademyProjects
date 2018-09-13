import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';

//ajax -> database -> success -> .then passes result of query to action for dispatch
export const requestAllPokemon = () => (dispatch) => (
  APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
);

export const receiveAllPokemon = pokemon => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});


export const RECEIVE_POKEMON_DETAIL = 'RECEIVE_POKEMON_DETAIL';

export const requestSinglePokemon = (pokemonId) => (dispatch) => (
  APIUtil.fetchPokemonDetail(pokemonId)
    .then(payload => dispatch(receivePokemonDetail(payload)))
);

export const receivePokemonDetail = payload => ({
  type: RECEIVE_POKEMON_DETAIL,
  payload
});
