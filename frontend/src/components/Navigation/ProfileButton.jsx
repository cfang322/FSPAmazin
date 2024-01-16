import { useState } from 'react';
import { useDispatch } from 'react-redux';
import * as sessionActions from '../../store/session';

function ProfileButton({ user }) {
    const dispatch = useDispatch();
    const [showMenu, setShowMenu] = useState(false);

    const logout = (e) => {
        e.preventDefault();
        dispatch(sessionActions.logout());
    };

    return (
        <div>
        <button onClick={() => setShowMenu(!showMenu)}>
            <i className="fas fa-user-circle" />
        </button>
        {showMenu && (
            <ul className="profile-dropdown">
                <li>{user.username}</li>
                <li>{user.email}</li>
                <li>
                    <button onClick={logout}>Log Out</button>
                </li>
            </ul>
        )}
        </div>
    );
}

export default ProfileButton;