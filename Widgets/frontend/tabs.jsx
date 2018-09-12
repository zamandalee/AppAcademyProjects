import React from 'react';
import TabHeader from './tab_header';

class Tabs extends React.Component {
  constructor(prop) {
    super(prop);

    this.tabs = prop.tabs;
    this.state = {
      index: 0
    };

    this.clickHandler = this.clickHandler.bind(this);
  }

  clickHandler(idx) {
    if (idx.constructor === String) {
      idx = parseInt(idx);
      this.setState({index: idx});
    }
  }

  render() {
    return (
      <div>
        <h1>Tabs</h1>
        <ul className="tabs" onClick={this.clickHandler}>
          {
            this.tabs.map( (tabHTML, idx) => {
              return <TabHeader
                key={`${idx}`}
                index={`${idx}`}
                tabHTML={tabHTML}
                func={this.clickHandler}
              />;
            })
          }
          <p className="tab-content">{this.tabs[this.state.index].content}</p>
        </ul>
      </div>
    );
  }

}

export default Tabs;
