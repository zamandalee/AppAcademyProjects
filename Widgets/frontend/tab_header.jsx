import React from 'react';

class TabHeader extends React.Component {

  render() {
    return (
      <li>
        <h1 onClick={() => this.props.func(this.props.index)}>
          {this.props.tabHTML.title}
        </h1>
      </li>
    );
  }

}
// <article>{this.tabHTML.content}</article>

export default TabHeader;
