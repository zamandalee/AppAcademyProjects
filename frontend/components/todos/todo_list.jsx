import React from 'react';
import ReactDOM from 'react-dom';

const TodoList = ({todos, receiveTodo}) => {
  return (
    <div>
      <ul>
        {/* fix key issue!! */}
        {todos.map((todo, idx) => <li key={idx}>{todo.title}</li>)}
      </ul>
    </div>
  );
};
export default TodoList;
