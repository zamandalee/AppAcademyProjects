const DOMNodeCollection = require('./dom_node_collection.js');

const $l = function(selector) {

  if(selector instanceof HTMLElement) {
    const selectorArr = Array.prototype.slice.call(selector);
    return new DOMNodeCollection(selectorArr);
  } else {
    let nodes = document.querySelectorAll(selector);
    nodes = Array.prototype.slice.call(nodes);
    return new DOMNodeCollection(nodes);
  }
  
};

window.$l = $l;