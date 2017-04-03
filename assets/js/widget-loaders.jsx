import ArgumentCards from './argument-cards'

import React from 'react';
import ReactDOM from 'react-dom';

document.renderWidget = (nodeID) => {
  ReactDOM.render(
    React.createElement(ArgumentCards),
    document.getElementById(nodeID)
  );
}
