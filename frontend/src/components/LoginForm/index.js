import  LoginForm  from "./LoginForm"
import { useSelector } from "react-redux"
import { Redirect } from "react-router-dom"
import "./LoginForm.css"

const LoginFormPage = () => {
    const currentUser = useSelector(state => state.session.user)

    return currentUser ?  (<Redirect to="/"/>) : (
        <LoginForm></LoginForm>
    )
}

export default LoginFormPage