import React from 'react';
import ReactDOM from 'react-dom';
import Cards, { Card } from 'react-swipe-card'

const data = ['Alexandre', 'Thomas', 'Lucien']

function action(param){
  return function() {
    console.log('action', param)
  }
}

export default class ArgumentCards extends React.Component {
  render() {
    return (
      <Cards onEnd={action('end')} className='card-stack'>
        {data.map(item =>
          <Card key={item} onSwipeLeft={action('swipe left')} onSwipeRight={action('swipe right')}>
            <div className="argument">
              <h2>Vaccinations are safe because there hasn't been mercury in them for ten years.</h2>
              <div className="details">
                <div className="detail-area">
                  <i className="fa fa-comments detail-icon"></i>
                  <div className="detail-description">245 comments</div>
                </div>
                <div className="detail-area">
                  <i className="fa fa-file-text detail-icon"></i>
                  <div className="detail-description">15 supporting sources</div>
                </div>
                <div className="detail-area">
                  <i className="fa fa-file-text-o detail-icon"></i>
                  <div className="detail-description">3 disputing sources</div>
                </div>
              </div>
            </div>
          </Card>
        )}
      </Cards>
    )
  }
}
