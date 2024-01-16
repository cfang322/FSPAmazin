import { useState } from 'react';
import * as sessionActions from '../../store/session';
import { useDispatch, useSelector } from 'react-redux';
import { useNavigate, NavLink } from 'react-router-dom'; // Import useNavigate
import './LoginForm.css';
import SignupForm from './SignUpForm';

function LoginForm() {
    const dispatch = useDispatch();
    const sessionUser = useSelector(state => state.session.user);
    const [credential, setCredential] = useState('');
    const [password, setPassword] = useState('');
    const [errors, setErrors] = useState('');

    const navigate = useNavigate(); // Get the navigate function

    if (sessionUser) {
        navigate('/', { replace: true });
        return null; // or any other component you want to render when already logged in
    }
    const handleSubmit = (e) => {
        e.preventDefault();
        setErrors([]);
        return dispatch(sessionActions.login({ credential, password }))
            .catch(async (res) => {
                let data;
                try {
                    data = await res.clone().json();
                } catch {
                    data = await res.text();
                }
                if (data?.errors) setErrors(data.errors);
                else if (data) setErrors([data]);
                else setErrors([res.statusText]);
        });
    };

    const handleSignupClick = () => {
        navigate('/signup'); // Navigate to the signup page
    };

    const loginDemo = (e) => {
        e.preventDefault();
        dispatch(sessionActions.login({credential: "demo@user.io", password: "password"}));
    };

    return (
        <div className="login-page">
                <div className="login-logo">
                    <NavLink to="/">
                        <img src="https://pbs.twimg.com/profile_images/1722015850168037376/OiNYYeZQ_400x400.jpg" alt="Amazin Logo"/>
                    </NavLink>
                </div>
                <form className="login-form" onSubmit={handleSubmit}>
                    <div className="card1">
                        <h1 className="signInH1">Sign in</h1>
                            <label className="login-label">Email
                                <input type="text" id="email"/>
                            </label>
                            <label className="login-label">Password
                                <input type="password" value={password} id="password" onChange={(e) => setPassword(e.target.value)} required/>
                            </label>
                        <button className="loginBtn" onClick={handleSubmit}>Continue</button>
                        <button className='demoLoginBtn' onClick={loginDemo}>Demo Log In</button>
                        <p>
                            By continuing, you agree to Amazin&apos;s Conditions of Use and Privacy Notice.
                        </p>
                    </div>
                </form>
                <br/>
                <div className="break1">
                    <p>New to Amazin?</p>
                </div>
                <div className="login-page-signup-button">
                    <button onClick={handleSignupClick}>Create your Amazin account</button>
                </div>
                <footer>
                    <div className="links">
                        <a href="https://github.com/cfang322">GitHub</a>
                        <a href="https://www.linkedin.com/in/yaqi-fang-125807250/">LinkedIn</a>
                    </div>
                    <p>© Winter 2024, Amazin.com, cloned by Yaqi Fang</p>
                </footer>
        </div>
    );
}

export default LoginForm;
