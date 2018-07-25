const FollowToggle = require("./follow_toggle.js");

$((cb) => {
  const $buttons = $("button.follow-toggle");
  $buttons.each( (idx, el) => {
    new FollowToggle(el);
  });
});