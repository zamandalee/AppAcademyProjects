import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './clock';
import Tabs from './tabs';

function generateTabs() {
  return [
    {title: "tab1", content: "I love ponies"},
    {title: "tab2", content: "I love dorks"},
    {title: "tab3", content: "I love red"}
  ];
}

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(
    <div>
      <Clock />
      <Tabs tabs={generateTabs()} />
    </div>,
  root);
});
