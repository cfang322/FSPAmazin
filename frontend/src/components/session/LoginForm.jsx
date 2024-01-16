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

    if (sessionUser) return <Navigate to="/" replace={true} />;

    const handleSubmit = async (e) => {
        e.preventDefault();
        setErrors('');

        try {
            await dispatch(sessionActions.login({ credential, password }));
        } catch (res) {
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
                    <img src="logo.png" alt=""/>
                </div>
                <div className="card">
                    <h1>Sign in</h1>
                    <div className="form">
                        <label htmlFor="email">Email or mobile phone number</label>
                        <input type="text" id="email"/>
                        <button onClick={handleSubmit}>Continue</button>
                    </div>
                    <p>
                        By continuing, you agree to Amazin's Conditions of Use and Privacy Notice.
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
