import React from 'react';
import ReactDOM from 'react-dom';
import Cards, { Card } from 'react-swipe-card'

const data = ['Alexandre', 'Thomas', 'Lucien']

function action(param){
  return function() {
    console.log('action', param)
  }
}

class HelloMessage extends React.Component {
  render() {
    return (
      <Cards onEnd={action('end')} className='master-root'>
        {data.map(item =>
          <Card
            key={item}
            onSwipeLeft={action('swipe left')}
            onSwipeRight={action('swipe right')}>
            <h2>{item}</h2>
          </Card>
        )}
      </Cards>
    )
  }
}

document.renderWidget = (nodeID) => {

  ReactDOM.render(
    React.createElement(HelloMessage, { name: "JaneX" }),
    document.getElementById(nodeID)
  );
}
