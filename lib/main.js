const DOMNodeCollection = require('./dom_node_collection.js');

const $l = function(selector) {
  
  let queue = [];

  if(selector instanceof HTMLElement) {
    const selectorArr = Array.prototype.slice.call(selector);
    return new DOMNodeCollection(selectorArr);
  } 
  else if (selector instanceof Function) {
    queue.push(selector);
  }
  else {
    let nodes = document.querySelectorAll(selector);
    nodes = Array.prototype.slice.call(nodes);
    return new DOMNodeCollection(nodes);
  }
  
  document.addEventListener("DOMContentLoaded", function() {
    for (let i = 0; i < queue.length; i++) {
      queue[i]();
    }
  });
  
};

window.$l = $l;
const test = window.$l( () => {
  console.log("function1");
});
