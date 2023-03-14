import './modal.css'
import logoImage from "./images/logo.jpg"
import { GrClose } from "react-icons/gr"

const SearchModal = (props) => {

    if (!props.show) {
        return null
    }
    
    return (
        <>
            <div className="search-modal" onClick={props.onClose}>
                <div className="search-modal-content" onClick={e => e.stopPropagation()}>
                    
                    <div className="search-modal-body">
                        <div className='button'><GrClose onClick={props.onClose} style={{ width: "2200px" }} /></div>
                        <img className='logo' src={logoImage}></img>
                        <input type="text" placeholder={`Search Arena Goods`}></input>
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