import React from 'react';
import { Link } from 'react-router-dom';

const PokemonIndexItem = ({ pokemon }) => (
  <li>
    <Link to={`/pokemon/${pokemon.id}`}>
      <span>{pokemon.id}</span>
      <img className="pokemon-item" src={pokemon.image_url}></img>
      <p>{pokemon.name}</p>
    </Link>
  </li>
);

export default PokemonIndexItem;
