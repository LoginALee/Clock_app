import React from 'react';
import PropTypes from 'prop-types';
class Timezone extends React.Component {
  render() {
    const timezone = this.props.timezone;

    return (
      <React.Fragment>
        <div className='col m-3'>
          <div className='card some' style={{ width: '18rem' }}>
            <div className='card-body'>
              <h5 className='card-title'>Time Zone</h5>
              <p className='card-text'>{timezone.name}</p>
              <p className='font-italic smaill'>{timezone.info}</p>
              <a
                href={`/timezones/${timezone.id}`}
                className='btn btn-danger'
                data-confirm='Are you sure?'
                rel='nofollow'
                data-method='delete'
              >
                Delete
              </a>
            </div>
          </div>
        </div>
      </React.Fragment>
    );
  }
}

Timezone.propTypes = {
  timezone: PropTypes.shape({
    id: PropTypes.number,
    name: PropTypes.string,
    info: PropTypes.string,
  }),
};

export default Timezone;
