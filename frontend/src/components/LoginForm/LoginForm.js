
import React, { useState } from 'react';
import * as sessionActions from '../../store/session';
import { useDispatch, useSelector } from 'react-redux';
import { Redirect } from 'react-router-dom';
// import './LoginFormPage.css'

function LoginFormPage() {
    const dispatch = useDispatch();
    const sessionUser = useSelector(state => state.session.user);
    const [email, setEmail] = useState("")
    const [password, setPassword] = useState("")
    const [errors, setErrors] = useState([])

    if (sessionUser) return <Redirect to="/" />;

    const handleSubmit = (e) => {
        e.preventDefault();
        setErrors([]);
        return dispatch(sessionActions.login({ email, password }))
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
    console.log(errors)
    const errorMessage = errors.map(error => <span key={error}>{error}</span>)

    const handleClick = (e) => {
        e.preventDefault()
        dispatch(sessionActions.login({ email: "demo@user.io", password: "password" }))
    }
    return (
        <>
            <div className="login-form">
                <h2 className="login-header">Welcome to Arena Goods</h2>
                <form className="login-form-container" onSubmit={handleSubmit}>
                    <input
                        className="email-input"
                        type="text"
                        value={email}
                        onChange={e => { setEmail(e.target.value) }}
                        placeholder="Email Address*"
                    />
                    <br></br>
                    <input
                        className="password-input"
                        type="password"
                        value={password}
                        onChange={e => { setPassword(e.target.value) }}
                        placeholder="Password*"
                    />
                    <br></br>
                    <button className="login-button">Login</button>
                    <button className="demo-user-button" onClick={handleClick}>Demo</button>
                    <br></br>
                    <br></br>
                    <p className='login-errors'>{errorMessage}</p>
                </form>

                <br />
                <div className="extra-links-login">
                    <a className="login-forgotpassword" href="#">Forgot Password?</a>
                    <span className="span"> | </span>
                    <a className="login-signup-link" href="/signup">Create an Account</a>
                </div>
            </div>
        </>
    )
}

export default LoginFormPage