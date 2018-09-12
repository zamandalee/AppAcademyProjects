const APIUtil = require('./api_util.js');
const FollowToggle = require('./follow_toggle.js');

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
    console.log(searchResults);
    $(searchResults).each( (idx, user) => {
      this.$ul.append(`<li><a href='/users/${user.id}'>${user.username}</a></li>`); 
      
      let difs = "unfollowed";
      if (user.followed) {
        difs = "followed";
      }
      this.$ul.append(`<button class="follow-toggle" data-user-id="${user.id}" data-initial-follow-state="${difs}" type="button" name="button"></button>`);
      
      let $button = $(`[data-user-id='${user.id}']`);
      new FollowToggle($button);
    });
  }
}

module.exports = UsersSearch;