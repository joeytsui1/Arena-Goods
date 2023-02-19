import  LoginForm  from "./LoginForm"
import { useDispatch, useSelector } from "react-redux"
import { Redirect } from "react-router-dom"
import "./LoginForm.css"
import { useEffect } from "react"
import { getProducts } from "../../store/product"

const LoginFormPage = () => {
    const dispatch = useDispatch()
    const currentUser = useSelector(state => state.session.user)
    useEffect(() => {
        dispatch(getProducts())
    }, [])
    return currentUser ? (<Redirect to="/"/>) : (
        <LoginForm></LoginForm>
    )
}

export default LoginFormPage