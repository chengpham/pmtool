import React from 'react';
import { NavLink } from 'react-router-dom';

const Navbar = () => {
  return(
    <nav>
      <NavLink to='/'>Home</NavLink>
      |
      <NavLink to='/projects'>Projects Index</NavLink>
      |
      <NavLink to='/projects/new'>Project New Page</NavLink>
    </nav>
  )

}

export default Navbar;