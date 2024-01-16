import { NavLink } from 'react-router-dom';
import { useSelector, useDispatch } from 'react-redux';
import * as sessionActions from '../../store/session';
// import cart from '../../images/cart.png';
// import arrow from '../../images/arrow.png';
// import git from '../../images/github.png';
// import linkedin from '../../images/linkedin.png';
import './Navigation.css';

function Navigation() {
    const sessionUser = useSelector((state) => state.session.user);
    const dispatch = useDispatch();

    const logout = (e) => {
        e.preventDefault();
        dispatch(sessionActions.logout());
    };



    const sessionLinks = sessionUser ? (
        <>
        <li>
            <button className='dropdwnSignoutBtn' onClick={logout}>Log Out</button>
        </li>
        </>
    ) : (
        <>
        <li className='dropdwnSign'>
            <NavLink id='dropdwnLoginBtn' to='/login'>Log in</NavLink>
        </li>
        <li>
            <NavLink id='signup' to="/signup">New costumer? Start here</NavLink>
        </li>
        </>
    );

    return (
        <>
        <ul className='navBar'>
            <div className='home'>
            </div>
            <li className="dropdown">
            <button className="dropbtn">{sessionUser ? `Hello, ${sessionUser.username}` : "Hello, sign in"}</button>
            <div className="dropdown-content">
                {sessionLinks}
            </div>
            </li>
        </ul>
        <ul className='lowerNavBar'>
            
        </ul>
        </>
    );
}

export default Navigation;