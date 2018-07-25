const APIUtil = require('./api_util.js');

class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userId = this.$el.attr("data-user-id");
    this.followState = this.$el.attr("data-initial-follow-state");
    this.render();
    console.log("hey");
    
    this.$el.on('click', (e) => {
      e.preventDefault();
      this.handleClick();
    });
  }
  
  render () {
    this.$el.prop("disabled", false);
    if (this.followState === "unfollowed") {
      this.$el.text("Follow!");
    } else if (this.followState === "loading") {
      this.$el.prop("disabled", true);
      this.$el.text("Loading...");
    } else {
      this.$el.text("Unfollow!");
    }
  }
  
  //toggle follow button
  handleClick () {
    if (this.followState === "unfollowed") {
      this.followState = "loading";
      this.render();

      APIUtil.followUser(this.userId).then(() => {
        this.followState = "followed";
        this.render();
      });
    } else {
      this.followState = "loading";
      this.render();
      APIUtil.unfollowUser(this.userId).then(() => {
        this.followState = "unfollowed";
        this.render();
      });
    }
  }
}

module.exports = FollowToggle;