import React from 'react';

const allTodos = (state) => (
  Object.keys(state.todos).map( id => state.todos[id])
);

export default allTodos;
