export const selectAllPokemon = (state) => {
  return _.values(state); //lodash's value method, returns array of keyed property values of arg
};
