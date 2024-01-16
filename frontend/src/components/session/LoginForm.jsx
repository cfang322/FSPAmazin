import { useState } from 'react';
import * as sessionActions from '../../store/session';
import { useDispatch, useSelector } from 'react-redux';
import { useNavigate } from 'react-router-dom'; // Import useNavigate
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
    const handleSubmit = async (e) => {
        e.preventDefault();
        setErrors('');

        try {
            // dispatch login action
            await dispatch(sessionActions.login({ credential, password }));
            // After successful login, redirect to the home page or another route
            navigate('/', { replace: true });
        } catch (res) {
            // Handle login errors
            let data;
            try {
                data = await res.clone().json();
            } catch {
                data = await res.text();
            }
            if (data?.errors) setErrors(data.errors);
            else if (data) setErrors(data);
            else setErrors(res.statusText);
        }
    };

    const handleSignupClick = () => {
        navigate('/signup'); // Navigate to the signup page
    };

    return (
        <>
            <head>
                <title>Amazin Signin Form</title>
            </head>
            <section>
                <div className="logo">
                    <img src="https://pbs.twimg.com/profile_images/1722015850168037376/OiNYYeZQ_400x400.jpg" alt="Amazin Logo"/>
                </div>
                <div className="card">
                    <h1>Sign in</h1>
                    <div className="form">
                        <label htmlFor="email">Email or mobile phone number</label>
                        <input type="text" id="email"/>
                        <button onClick={handleSubmit}>Continue</button>
                    </div>
                    <p>
                        By continuing, you agree to Amazin&apos;s Conditions of Use and Privacy Notice.
                    </p>
                </div>
                <div className="break">
                    <p>New to Amazin?</p>
                </div>
                <div className="btn">
                    <button onClick={handleSignupClick}>Create your Amazin account</button>
                </div>
                <footer>
                    <div className="links">
                        <a href="https://github.com/cfang322">GitHub</a>
                        <a href="https://www.linkedin.com/in/yaqi-fang-125807250/">LinkedIn</a>
                    </div>
                    <p>© Winter 2024, Amazin.com, cloned by Yaqi Fang</p>
                </footer>
            </section>
        </>
    );
}

export default LoginForm;
