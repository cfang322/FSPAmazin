import { useDispatch, useSelector } from "react-redux";
import { useEffect } from "react";
import { NavLink } from "react-router-dom";
import { memoizedSelectCartItems, fetchCart } from "../../store/cartItem";
import { fetchProducts, selectProductsArray } from "../../store/product";
import CartItemIndex from "./CartItemIndex";
import cart from "../../images/cart.png";

const CartIndex = () => {
    const dispatch = useDispatch();
    const cartItems = useSelector(memoizedSelectCartItems);
    const products = useSelector(selectProductsArray);
    const sessionUser = useSelector((state) => state.session.user);
    useEffect(() => {
        dispatch(fetchCart());
        dispatch(fetchProducts());
    }, [dispatch]);
    
    let total = 0.00;
    let quantity = 0;
    let amount = 100;
    cartItems.forEach(item => {
        products.forEach(product => {
            if (item.productId === product.id) {
                quantity += item.quantity;
                total += Math.round(item.quantity * product.price);
                amount -= Math.round(item.quantity * product.price);
            }
        });
    });
    
    return (
        <div className="CartPageDiv">
            {cartItems.length === 0 ? (
                <div className="cartImg">{<img src={cart} alt="cart-img" />}</div>
            ) : (
                <p></p>
            )}
            <br />
            <br />
            <br />
            {cartItems.length === 0 ? (
                <div className="emptyCartContainer">
                    <h1 className="emptyCartH1">Your Amazin Cart is empty</h1>
                    <NavLink>
                        <p className="emptyCartP">Shop today&apos;s deals</p>
                    </NavLink>
                    {!sessionUser ? (
                        <div className="cartSessionBtns">
                            <NavLink to="/login">
                                <button className="emptyCartBtnSignIn">Sign in to your account</button>
                            </NavLink>
                            <NavLink to="/signup">
                                <button className="emptyCartBtnSignUp">Sign up now</button>
                            </NavLink>
                        </div>
                    ) : (
                    <p></p>
                    )}
                </div>
                ) : (
                <ul className="CartIndexUl">
                    {cartItems.map((cartItem, index) => (
                        <li className="cartIndexLi" key={`${cartItem.id}_${index}`}>
                            <CartItemIndex cartItem={cartItem} />
                        </li>
                    ))}
                    <div className="sideCheckoutContainer">
                        { total > 100 ? 
                            (<p className='freeShip'>Your order qualifies for FREE Shipping.</p>
                        ):(
                            <p className='addMoreItems'>Add <span className='amount'>${amount}.00</span> to your order to qualify for FREE shipping</p>)
                        }
                        <p className="totalPriceP">Subtotal({quantity} item): ${total}.00</p>
                        { quantity ?
                            (<NavLink className="checkoutButton" to="/checkout">Proceed to checkout</NavLink>
                        ):(
                            <NavLink className="checkoutButton" to="">Proceed to checkout</NavLink>)
                        }
                    </div>
                </ul>
            )}
            
        </div>
    );
};

export default CartIndex; 