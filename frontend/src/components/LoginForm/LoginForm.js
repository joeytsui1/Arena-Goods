
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
    const [validEmailError, setValidEmailError] = useState('');
    const [validPasswordError, setValidPasswordError] = useState("")
    if (sessionUser) return <Redirect to="/" />;

    const handleSubmit = (e) => {
        e.preventDefault();
        setErrors([]);
        return dispatch(sessionActions.login({ email, password }))
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
    }

    const isValidEmail = (email) => {
        return email.match(
            /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
        )
    }

    const isValidPassword = (password) => {
        return password.length >= 6
    }

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
                        onChange={e => { setEmail(e.target.value);
                            setValidEmailError(!isValidEmail(e.target.value) ? 'Please Enter a Valid Email Address' : ''); }}
                        placeholder="Email Address*"
                    /> 
                    <p className='login-errors'>{validEmailError}</p>
                    <br></br>
                    <input
                        className="password-input"
                        type="password"
                        value={password}
                        onChange={e => { setPassword(e.target.value);
                            setValidPasswordError(!isValidPassword(e.target.value) ? "Password must be at least 6 characters long" : "")}}
                        placeholder="Password*"
                    />
                    <p className='login-errors'>{validPasswordError}</p>
                    <br></br>
                    <button className="login-button">Login</button>
                    <button className="demo-user-button" onClick={handleClick}>Demo</button>
                    <br></br>
                    <br></br>
                    <p className='login-errors'>{errorMessage}</p>
                </form>

                <br />
                <div className="extra-links-login">
                    <a className="login-signup-link" href="/signup">Create an Account</a>
                </div>
            </div>
        </>
    )
}

export default LoginFormPage