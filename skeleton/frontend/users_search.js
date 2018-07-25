const APIUtil = require('./api_util.js');

class UsersSearch {
  constructor(el) {
    this.$el = $(el);
    this.$input = $("nav input");
    this.$ul = $(".users");
    
    this.$input.on('input', (e) => {
      e.preventDefault();
      this.handleInput();
    });
  }
  
  handleInput() {
    // debugger;
    APIUtil.searchUsers(this.$input.val()).then( (results) => this.renderResults(results));
  }
  
  renderResults(searchResults) {
    this.$ul.empty(); 
    
    $(searchResults).each( (idx, result) => {
      this.$ul.append(`<li><a href='/users/${result.id}'>${result.username}</a></li>`); //erb tag, ticks vs quotes
    });
  }
}

module.exports = UsersSearch;