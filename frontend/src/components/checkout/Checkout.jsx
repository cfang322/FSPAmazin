import { useSelector, useDispatch } from 'react-redux';
import { useEffect } from 'react';
import { deleteCartItem, memoizedSelectCartItems } from '../../store/cartItem';
import './Checkout.css'

const Checkout = () => {
    const dispatch = useDispatch();
    const cartItems = useSelector(memoizedSelectCartItems);
    
    useEffect(() => {
        cartItems.forEach(item => {
            dispatch(deleteCartItem(item.id))
        });
    }, [dispatch, cartItems]);
    
    return (
        <div className="checkoutPage">
            <h3 className="checkoutMessage">Thank you for placing your order.</h3>
        </div>
    );
}

export default Checkout;