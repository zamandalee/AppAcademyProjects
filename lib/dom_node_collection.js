class DOMNodeCollection {
  constructor(elArr) {
    this.$el = elArr;
  }
  
  html(str) {
    if(str) {
      this.$el.forEach( (node) => {
        node.innerHTML = str;
      });  
    } else { 
      return this.$el[0].innerHTML;
    }
  }
  
  empty() {
    this.$el.forEach( (node) => {
      node.innerHTML = "";
    });
  }
  
  append(arg) {
    this.$el.forEach( (node) => {
      if (arg.constructor === String) {
        node.innerHTML = node.innerHTML + arg;
      } else {
        arg.$el.forEach( (childNode) => {
          node.innerHTML = node.innerHTML + childNode.outerHTML;
        });
      }
    });
  }
  
  attr(attrName, val) {
    //find attribute val for first element in ?this.$el?
    if (val) {
      for (let i = 0; i < this.$el.length; i++) {
        this.$el[i].setAttribute(attrName, val);
      }
    } else {
      for (let i = 0; i < this.$el.length; i++) {
        let currNode = this.$el[i].getAttribute(attrName);
        if (currNode) {
          return currNode;
        }
      }
    }
  }
  
  addClass(val) {
    this.attr("class", val);
  }
  
  removeClass() {
    for (let i = 0; i < this.$el.length; i++) {
      this.$el[i].removeAttribute("class");
    }
  }
  
  children() {
    let childNodes = [];
    for(let i = 0 ; i < this.$el.length;i++) {
      childNodes.push(this.$el[i].children);
    }
    return new DOMNodeCollection(childNodes);
  }
  
  parent() {
    let parentNodes = [];
    for (let i = 0; i < this.$el.length; i++) {
      parentNodes.push(this.$el[i].parentElement);
    }
    return new DOMNodeCollection(parentNodes);
  }
  
  find(selector) {
    // find all children, find only children that match selector
    const found = [];
    for (let i = 0; i < this.$el.length; i++) {
      found.push( this.$el[i].querySelectorAll(selector) );
    }
    return new DOMNodeCollection(found);
  }
  
  remove() {
    for(let i = 0 ; i < this.$el.length ;i++) {
      this.$el[i].remove();
    }
    this.$el = [];
  }
  
}


module.exports = DOMNodeCollection;