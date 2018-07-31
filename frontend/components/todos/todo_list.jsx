import React from 'react';
import ReactDOM from 'react-dom';
import TodoListItem from './todo_list_item.jsx'

const TodoList = ({todos, receiveTodo}) => {
  return (
    <div>
      <ul>
        {todos.map((todo, idx) => <TodoListItem todo={todo} key={idx}/>)}
      </ul>
    </div>
  );
};
export default TodoList;
