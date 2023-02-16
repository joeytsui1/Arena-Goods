import './modal.css'
import { useEffect, useState } from 'react'
import { useDispatch } from 'react-redux'
import { patchCart } from '../../store/cart'

const Modal = prop => {
    const dispatch = useDispatch()
    const [size, setSize] = useState(prop.product.size)
    const [quantity, setQuantity] = useState(prop.product.quantity)
    const [sizeHide, setSizeHide] = useState(true)
    const [quantityHide, setQuantityHide] = useState(true)

    useEffect(() => {

    }, [size, quantity])

    if(!prop.show) {
        return null
    }

    const updateOnClick = (e) => {
        e.preventDefault()

        const updated = {
            ...prop.product,
            size: size,
            quantity: quantity
        }
        dispatch(patchCart(updated))
        prop.onClose()  
    }

    // FOR SIZES
    const handleSizeClick = (e) => {
        e.preventDefault()
        setSizeHide(!sizeHide)
    } 

    const sizeClick = (e) => {
        e.preventDefault()
        setSize(e.target.value)
        setSizeHide(!sizeHide)
    }

    // FOR QUANTITY

    const handleClick = (e) => {
        e.preventDefault()
        setQuantityHide(!quantityHide)
    }

    const quantityClick = (e) => {
        e.preventDefault()
        setQuantity(e.target.value)
        setQuantityHide(!quantityHide)
    }
    
    const text = size ? `US Size ${size}` : "Select A Size"
    const text2 = quantity ? `Quantity: ${quantity}` : "Quantity: 1"
    // console.log(size)
    console.log(quantity)
    return (
        <div className="modal" onClick={prop.onClose}>
            <div className="modal-content" onClick={e => e.stopPropagation()}> 
                <div className="modal-body">
                    <div className='modal-body-div'>
                        <img className='modal-img' src={`${prop.product.image}`}></img>
                        <div>
                            <h1>{prop.product.brand}</h1>
                            <h1>{prop.product.style}</h1>
                            <p>{prop.product.name}</p>
                        </div>

                    </div>
                </div>

                <div className="checkout-box">
                    <button className="size-option" onClick={handleSizeClick}>
                        {text}
                        <svg width="1em" height="1em" viewBox="0 0 8 4" class="css-155lj9h e1l7f7ih0"><path d="M0 0L8 0L4 4L0 0Z" fill="currentColor"></path></svg>
                    </button>
                    {sizeHide ? null :
                        <>
                            <div className="inner-buttons-div update-modal">
                                <button className="size-inner-option" value={4} onClick={sizeClick}>Size 4</button>
                                <button className="size-inner-option" value={4.5} onClick={sizeClick}>Size 4.5</button>
                                <button className="size-inner-option" value={5} onClick={sizeClick}>Size 5</button>
                                <button className="size-inner-option" value={5.5} onClick={sizeClick}>Size 5.5</button>
                                <button className="size-inner-option" value={6} onClick={sizeClick}>Size 6</button>
                                <button className="size-inner-option" value={6.5} onClick={sizeClick}>Size 6.5</button>
                                <button className="size-inner-option" value={7} onClick={sizeClick}>Size 7</button>
                                <button className="size-inner-option" value={7.5} onClick={sizeClick}>Size 7.5</button>
                                <button className="size-inner-option" value={8} onClick={sizeClick}>Size 8</button>
                                <button className="size-inner-option" value={8.5} onClick={sizeClick}>Size 8.5</button>
                                <button className="size-inner-option" value={9} onClick={sizeClick}>Size 9</button>
                                <button className="size-inner-option" value={9.5} onClick={sizeClick}>Size 9.5</button>
                                <button className="size-inner-option" value={10} onClick={sizeClick}>Size 10</button>
                                <button className="size-inner-option" value={10.5} onClick={sizeClick}>Size 10.5</button>
                                <button className="size-inner-option" value={11} onClick={sizeClick}>Size 11</button>
                                <button className="size-inner-option" value={11.5} onClick={sizeClick}>Size 11.5</button>
                                <button className="size-inner-option" value={12} onClick={sizeClick}>Size 12</button>
                            </div>
                        </>
                    }
                </div>


                <div className="checkout-box">
                    <button className="size-option" onClick={handleClick}>
                        {text2}
                        <svg width="1em" height="1em" viewBox="0 0 8 4" class="css-155lj9h e1l7f7ih0"><path d="M0 0L8 0L4 4L0 0Z" fill="currentColor"></path></svg>
                    </button>
                    {quantityHide ? null :
                        <>
                            <div className="inner-buttons-div update-modal">
                                <button className="size-inner-option" value={1} onClick={quantityClick}>1</button>
                                <button className="size-inner-option" value={2} onClick={quantityClick}>2</button>
                                <button className="size-inner-option" value={3} onClick={quantityClick}>3</button>
                                <button className="size-inner-option" value={4} onClick={quantityClick}>4</button>
                                <button className="size-inner-option" value={5} onClick={quantityClick}>5</button>
                                <button className="size-inner-option" value={6} onClick={quantityClick}>6</button>
                                <button className="size-inner-option" value={7} onClick={quantityClick}>7</button>
                                <button className="size-inner-option" value={8} onClick={quantityClick}>8</button>
                                <button className="size-inner-option" value={9} onClick={quantityClick}> 9</button>
                                <button className="size-inner-option" value={10} onClick={quantityClick}>10</button>
                            </div>
                        </>
                    }

                    <button onClick={updateOnClick} className="add-to-cart">Update Cart</button>
                </div>
            </div>
        </div>
    )
}

export default Modal