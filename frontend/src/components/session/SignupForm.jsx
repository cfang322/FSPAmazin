import { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Navigate, NavLink } from 'react-router-dom';
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
    
    // const handleSubmit = (e) => {
    //     e.preventDefault();
    //     setErrors([]);
    //     return dispatch(sessionActions.signup({ email, username, password }))
    //         .catch(async (res) => {
    //             let data;
    //             try {
    //             data = await res.clone().json();
    //             } catch {
    //             data = await res.text();
    //             }
    //             if (data?.errors) setErrors(data.errors);
    //             else if (data) setErrors([data]);
    //             else setErrors([res.statusText]);
    //         });
    // };
    const handleSubmit = (e) => {
        e.preventDefault();
    
        if (password === confirmPassword && email.includes("@")) {
          setErrors([]);
          return dispatch(sessionActions.signup({ email, name, password })).catch(
            async (res) => {
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
            }
          );
        }
        if (password !== confirmPassword) {
          return setErrors([
            "Password must match confirmed password",
          ]);
        } else if (email.includes("@")) {
          return setErrors([
            "Must be a valid email",
          ]);
        }
        return setErrors(["Must be a valid email"]);
      };
    
    return (
        <div className="signup-page">
            <div className="signup-logo">
                <NavLink to="/">
                    <img src="https://pbs.twimg.com/profile_images/1722015850168037376/OiNYYeZQ_400x400.jpg" alt="Amazin Logo"/>
                </NavLink>
            </div>
            
            <form className="signup-form" onSubmit={handleSubmit}>
                {/* <ul className='errors'>
                    {errors.map(error => <li key={error}>{error}</li>)}
                </ul> */}
                <div className="card2">
                <h1 className="signUpH1">Create account</h1>
                <ul className='errors'>
                    {errors.map(error => <li key={error}>{error}</li>)}
                </ul>
                    <label className="signup-label">Your name
                        <input
                            type="text"
                            value={username}
                            placeholder="First and last name"
                            onChange={(e) => setUsername(e.target.value)}
                            required
                        />
                    </label>
                    <label className="signup-label">Email
                        <input
                            type="text"
                            value={email}
                            onChange={(e) => setEmail(e.target.value)}
                            required
                        />
                    </label>
                    <label className="signup-label">Password
                        <input
                            type="password"
                            value={password}
                            placeholder="At least 6 characters"
                            onChange={(e) => setPassword(e.target.value)}
                            required
                        />
                    </label>
                    <label className="signup-label">Re-enter password
                        <input
                            type="password"
                            value={confirmPassword}
                            onChange={(e) => setConfirmPassword(e.target.value)}
                            required
                        />
                    </label>
                <br/>
                <button type="submit" className="signupBtn">Continue</button>
                <div className="inside-divider"></div>
                <p className='question'>Already have an account?
                    <NavLink className='have-acc' to='/login'>Sign in</NavLink>
                </p>
                </div>
                <p>
                    By continuing, you agree to Amazin&apos;s Conditions of Use and Privacy Notice.
                </p>
            </form>
            <div className="form-divider">
                <div className="links">
                    <a href="https://github.com/cfang322">GitHub</a>
                    <a href="https://www.linkedin.com/in/yaqi-fang-125807250/">LinkedIn</a>
                </div>
                <p>© Winter 2024, Amazin.com, cloned by Yaqi Fang</p>
            </div>
        </div>    
    );
}

export default SignupForm;