import { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Navigate } from 'react-router-dom';
import * as sessionActions from '../../store/session';
import './SignupForm.css';

function SignupForm() {
    const dispatch = useDispatch();
    const sessionUser = useSelector(state => state.session.user);
    const [email, setEmail] = useState("");
    const [username, setUsername] = useState("");
    const [password, setPassword] = useState("");
    const [confirmPassword, setConfirmPassword] = useState("");
    const [errors, setErrors] = useState([]);

    if (sessionUser) return <Navigate to="/" replace={true}/>;

    const handleSubmit = (e) => {
        e.preventDefault();
        if (password === confirmPassword) {
        setErrors([]);
        return dispatch(sessionActions.signup({ email, username, password }))
            .catch(async (res) => {
            let data;
            try {
                // .clone() essentially allows you to read the response body twice
                data = await res.clone().json();
            } catch {
                data = await res.text(); // Will hit this case if the server is down
            }
            if (data?.errors) setErrors(data.errors);
            else if (data) setErrors([data]);
            else setErrors([res.statusText]);
            });
        }
        return setErrors(['Confirm Password field must be the same as the Password field']);
    };

    return (
        <>
        <head>
        <title>Amazin Signup Form</title>
        </head>
        <section>
            <div className="logo">
                <img src="https://pbs.twimg.com/profile_images/1722015850168037376/OiNYYeZQ_400x400.jpg" alt="Amazin Logo" />
            </div>
            <div className="outer-box">
                <div className="inner-box">
                    <h1>Create account</h1>
                    <div className="form">
                        <ul>
                            {errors.map(error => <li key={error}>{error}</li>)}
                        </ul>
                        <label>Your name
                            <input
                                type="text"
                                maxLength="50"
                                placeholder="First and last name"
                                value={email}
                                onChange={(e) => setEmail(e.target.value)}
                                required
                            />
                        </label>
                        <label>Mobile number or email
                            <input
                                type="text"
                                value={username}
                                onChange={(e) => setUsername(e.target.value)}
                                required
                            />
                        </label>
                        <label>Password
                            <input
                                type="password"
                                value={password}
                                onChange={(e) => setPassword(e.target.value)}
                                required
                            />
                        </label>
                        <label>Re-enter Password
                            <input
                                type="password"
                                value={confirmPassword}
                                onChange={(e) => setConfirmPassword(e.target.value)}
                                required
                            />
                        </label>
                        <div className="btn">
                            <button type="submit">Continue</button>
                        </div>
                    </div>
                </div>
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

export default SignupForm;