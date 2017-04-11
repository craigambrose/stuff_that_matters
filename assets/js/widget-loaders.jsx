import ArgumentCards from './argument-cards'
import PositionGuage from './position-guage'

import React from 'react';
import ReactDOM from 'react-dom';

const widgets = {
  argumentCards: ArgumentCards,
  positionGuage: PositionGuage
}

document.renderWidget = (widgetName, nodeID) => {
  const widget = widgets[widgetName]
  ReactDOM.render(
    React.createElement(widget),
    document.getElementById(nodeID)
  );
}
