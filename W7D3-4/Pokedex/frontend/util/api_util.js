export const fetchAllPokemon = () => {
  return $.ajax({
    method: 'GET',
    url: 'api/pokemon'
  });
};

export const fetchPokemonDetail = (pokemonId) => {
  return $.ajax({
    method: 'GET',
    url: `api/pokemon/${pokemonId}`
  });
};
