import './modal.css'
import logoImage from "./images/logo.jpg"
import { GrClose } from "react-icons/gr"
import { useState } from 'react'
import { Redirect, useHistory } from 'react-router-dom'
import { getProducts } from "../../store/product"
import { useDispatch } from 'react-redux'

const SearchModal = (props) => {

    const [search, setSearch] = useState("")
    const dispatch = useDispatch()
    const history = useHistory()
    if (!props.show) {
        return null
    }
    
    const handleSubmit = (e) => {
        e.preventDefault()
        dispatch(getProducts(search))
        search === "" ? history.push('/products') : history.push(`/search/${search}`) 
        props.onClose()
    }

    const handleChange = (e) => {
        e.preventDefault()
        setSearch(e.target.value)
    }

    const handleKeyDown = (event) => {
        if (event.keyCode === 13) {
            handleSubmit(event);
        }
    };


    return (
        <>
            <div className="search-modal" onClick={props.onClose}>
                <div className="search-modal-content" onClick={e => e.stopPropagation()}>
                    
                    <div className="search-modal-body">
                        <div className='button'><GrClose onClick={props.onClose} style={{ width: "2200px" }} /></div>
                        <img className='logo' src={logoImage}></img>
                        <form>
                            <input type="text" placeholder={`Search Arena Goods`} onChange={handleChange} onKeyDown={handleKeyDown}></input>
                        </form>
                        
                        <p>Hit enter to see results</p>
                    </div>
                    <div className='others'>
                        <p>Or explore our popular categories: </p>
                        <br></br>
                        <div className="search-links">
                            <a href='/brands/jordan'>Jordan</a>
                            <a href='/brands/nike'>Nike</a>
                            <a href='/brands/adidas'>Adidas</a>
                            <a href='/brands/new-balance'>New Balance</a>
                            <a href='/brands/asics'>Asics</a>
                            <a href='/products'>All Brand</a>
                        </div>
                    </div>
                </div>
            </div>
        </>
    )
}

export default SearchModal