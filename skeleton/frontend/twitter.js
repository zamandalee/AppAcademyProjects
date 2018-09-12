const FollowToggle = require("./follow_toggle.js");
const UsersSearch = require("./users_search.js");

$((cb) => {
  const $buttons = $("button.follow-toggle");
  $buttons.each ( (idx, el) => {
    new FollowToggle(el);
  });
  
  const $searches = $("nav.users-search");
  $searches.each ( (idx, el) => {
    new UsersSearch(el);
  });
});