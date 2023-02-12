import React, { useState } from "react"
import { Redirect } from "react-router-dom"
import * as sessionActions from "../../store/session"
import { useDispatch, useSelector } from "react-redux"
import "./SignUpFormPage.css"

const SignUpForm = () => {
    const dispatch = useDispatch()
    const [email, setEmail] = useState("")
    const [password, setPassword] = useState("")
    const [first, setFirst] = useState("")
    const [last, setLast] = useState("")
    const [errors, setErrors] = useState([])
    const currentUser = useSelector(state => state.session.user)

    const handleSubmit = (e) => {
        e.preventDefault();
        setErrors([]);
        return dispatch(sessionActions.signup({ email, password, first, last }))
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
    const firstNameErrors = errors.find(error => error.includes("First"))
    const lastNameErrors = errors.find(error => error.includes("Last"))
    const emailErrors = errors.find(error => error.includes("Email"))
    const passwordErrors = errors.find(error => error.includes("Password"))
    console.log(errors)
    return currentUser ? (<Redirect to="/"/>) : (
        <>
        <div className="signup-page">
            <h2 className="signup-header">
                Looks like you're new here.
                <br />
                We need some info.
            </h2>

            <form onSubmit={handleSubmit}>
                <input
                    type="text"
                    value={first}
                    onChange={e => { setFirst(e.target.value) }}
                    placeholder="First Name*"
                />
                <br></br>
                <p className='signup-errors'>{firstNameErrors}</p>
                <input
                    type="text"
                    value={last}
                    onChange={e => { setLast(e.target.value) }}
                    placeholder="Last Name*"
                />
                <br></br>
                <p className='signup-errors'>{lastNameErrors}</p>
                <input
                    type="text"
                    value={email}
                    onChange={e => { setEmail(e.target.value) }}
                    placeholder="Email Address*"
                />
                <br></br>
                <p className='signup-errors'>{emailErrors}</p>
                <input
                    type="password"
                    value={password}
                    onChange={e => { setPassword(e.target.value) }}
                    placeholder="Password*"
                />
                <br></br>
                <p className='signup-errors'>{passwordErrors}</p> 
                <br></br>
                <div>
                    <p className="policy">By clicking "Register", you agree to our <a href="#">Terms and condition</a> and <a href="#">Privacy Policy</a>
                    </p>
                </div>
                <button className="signup-button">Register</button>
            </form>

            <div>
                <a className="signup-login-link" href="/login">Already Registered?</a>
            </div>
        </div>
        </>
    )
}

export default SignUpForm