/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./lib/main.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./lib/dom_node_collection.js":
/*!************************************!*\
  !*** ./lib/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DOMNodeCollection {\n  constructor(elArr) {\n    this.$el = elArr;\n  }\n  \n  html(str) {\n    if(str) {\n      this.$el.forEach( (node) => {\n        node.innerHTML = str;\n      });  \n    } else { \n      return this.$el[0].innerHTML;\n    }\n  }\n  \n  empty() {\n    this.$el.forEach( (node) => {\n      node.innerHTML = \"\";\n    });\n  }\n  \n  append(arg) {\n    this.$el.forEach( (node) => {\n      if (arg.constructor === String) {\n        node.innerHTML = node.innerHTML + arg;\n      } else {\n        arg.$el.forEach( (childNode) => {\n          node.innerHTML = node.innerHTML + childNode.outerHTML;\n        });\n      }\n    });\n  }\n  \n  attr(attrName, val) {\n    //find attribute val for first element in ?this.$el?\n    if (val) {\n      for (let i = 0; i < this.$el.length; i++) {\n        this.$el[i].setAttribute(attrName, val);\n      }\n    } else {\n      for (let i = 0; i < this.$el.length; i++) {\n        let currNode = this.$el[i].getAttribute(attrName);\n        if (currNode) {\n          return currNode;\n        }\n      }\n    }\n  }\n  \n  addClass(val) {\n    this.attr(\"class\", val);\n  }\n  \n  removeClass() {\n    for (let i = 0; i < this.$el.length; i++) {\n      this.$el[i].removeAttribute(\"class\");\n    }\n  }\n  \n  children() {\n    let childNodes = [];\n    for(let i = 0 ; i < this.$el.length;i++) {\n      childNodes.push(this.$el[i].children);\n    }\n    return new DOMNodeCollection(childNodes);\n  }\n  \n  parent() {\n    let parentNodes = [];\n    for (let i = 0; i < this.$el.length; i++) {\n      parentNodes.push(this.$el[i].parentElement);\n    }\n    return new DOMNodeCollection(parentNodes);\n  }\n  \n  find(selector) {\n    // find all children, find only children that match selector\n    const found = [];\n    for (let i = 0; i < this.$el.length; i++) {\n      found.push( this.$el[i].querySelectorAll(selector) );\n    }\n    return new DOMNodeCollection(found);\n  }\n  \n  remove() {\n    for(let i = 0 ; i < this.$el.length ;i++) {\n      this.$el[i].remove();\n    }\n    this.$el = [];\n  }\n  \n  on(eventType, callback) {\n    for(let i = 0 ; i < this.$el.length ;i++) {\n      this.$el[i].addEventListener(eventType,callback);\n      this.$el[i].onCallback = callback;\n    }\n  }\n  \n  off(eventType) {\n    for(let i = 0 ; i < this.$el.length ;i++) {\n      this.$el[i].removeEventListener(eventType, this.$el[i].onCallback);\n    }\n  }\n  \n}\n\n\nmodule.exports = DOMNodeCollection;\n\n//# sourceURL=webpack:///./lib/dom_node_collection.js?");

/***/ }),

/***/ "./lib/main.js":
/*!*********************!*\
  !*** ./lib/main.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection.js */ \"./lib/dom_node_collection.js\");\n\nconst $l = function(selector) {\n\n  if(selector instanceof HTMLElement) {\n    const selectorArr = Array.prototype.slice.call(selector);\n    return new DOMNodeCollection(selectorArr);\n  } else {\n    let nodes = document.querySelectorAll(selector);\n    nodes = Array.prototype.slice.call(nodes);\n    return new DOMNodeCollection(nodes);\n  }\n  \n};\n\nwindow.$l = $l;\n\n//# sourceURL=webpack:///./lib/main.js?");

/***/ })

/******/ });