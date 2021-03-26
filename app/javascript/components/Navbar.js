import React from 'react';
import Avatar from './Avatar';
import PropTypes from 'prop-types';

class Navbar extends React.Component {
  render() {
    if (this.props.userSingnedIn === false) {
      return (
        <React.Fragment>
          <nav className='navbar sticky-top navbar-expand-md navbar-dark bg-dark'>
            <a className='navbar-brand font-weight-bold' href='/'>
              ClockApp
            </a>
          </nav>
        </React.Fragment>
      );
    }

    return (
      <React.Fragment>
        <nav className='navbar sticky-top navbar-expand-md navbar-dark bg-dark'>
          <a className='navbar-brand font-weight-bold' href='/'>
            ClockApp
          </a>
          <ul className='navbar-nav ml-auto mr-5'>
            <li className='nav-item'>
              <a className='nav-link' href='/timezones'>
                Timezones
              </a>
            </li>
            <li className='nav-item'>
              <a className='nav-link' href='/stopwatches'>
                Stopwatches
              </a>
            </li>
            <li className='nav-item'>
              <a className='nav-link' href='/alarms'>
                Alarms
              </a>
            </li>
            <li className='nav-item'>
              <a className='nav-link' href='/timers'>
                Timers
              </a>
            </li>
            <li className='nav-item dropdown'>
              <a
                className='nav-link'
                id='navbarDropdownMenuLink'
                href='#'
                role='button'
                data-toggle='dropdown'
                aria-haspopup='true'
                aria-expanded='false'
              >
                <Avatar imageSrc={this.props.avatar} />
              </a>
              <div
                className='dropdown-menu'
                aria-labelledby='navbarDropdownMenuLink'
              >
                <a className='dropdown-item' href='/profile'>
                  Edit
                </a>
                <a
                  className='dropdown-item'
                  rel='nofollow'
                  data-method='delete'
                  href='/users/sign_out'
                >
                  Logout
                </a>
              </div>
            </li>
          </ul>
        </nav>
      </React.Fragment>
    );
  }
}

Navbar.propTypes = {
  avatar: PropTypes.string,
  userSingnedIn: PropTypes.bool,
};

export default Navbar;
