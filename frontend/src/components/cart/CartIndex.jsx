import { useDispatch, useSelector } from "react-redux";
import { useEffect } from "react";
import { NavLink } from "react-router-dom";
import { memoizedSelectCartItems, fetchCart } from "../../store/cartItem";
import { selectProductsArray } from "../../store/product";
import CartItemIndex from "./CartItemIndex";

const CartIndex = () => {
    const dispatch = useDispatch();
    const cartItems = useSelector(memoizedSelectCartItems);
    const products = useSelector(selectProductsArray);
    const sessionUser = useSelector((state) => state.session.user);
    useEffect(() => {
        dispatch(fetchCart());
    }, [dispatch]);
    
    let total = 0.0;
    let quantity = 0;
    let amount = 100;
    
    cartItems.forEach((item) => {
        products.forEach((product) => {
        if (item.productId === product.id) {
            quantity += item.quantity;
            total += Math.round(item.quantity * product.price);
            amount -= Math.round(item.quantity * product.price);
        }
        });
    });
    
    return (
        <div className="CartPageDiv">
            {/* This conditional statement checks if the length of cartItems array is zero. If true (cart is empty), it renders a <div> with the CSS class cartImgDiv (commented out image element). If false (cart is not empty), it renders an empty <p> element. */}
            {cartItems.length === 0 ? (
                <div className="cartImgDiv">{/* <img src={cartImg} alt="" /> */}</div>
            ) : (
                <p></p>
            )}
            
            {cartItems.length === 0 ? (
                <div className="emptyCartDiv">
                <div className="emptyCartDealsDiv">
                    <h1 className="emptyCartH1">Your Amazin Cart is empty</h1>
                    <NavLink>
                    <p className="emptyCartP">Shop today&apos;s deals</p>
                    </NavLink>
                </div>
                
                {!sessionUser ? (
                    <div className="cartSessionBtns">
                    <NavLink to="/login">
                        <button className="emptyCartBtnSignIn">
                        Sign in to your account
                        </button>
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
                </ul>
            )}
            
            <div className="checkoutSideDiv">
                {total > 100 ? (
                <p className="freeShip">Your order qualifies for FREE Shipping.</p>
                ) : (
                <p className="addMoreItems">
                    Add <span className="amount">${amount}</span> to your order to
                    qualify for FREE shipping
                </p>
                )}
                <p className="totalPriceP">
                Total({quantity}): ${total}.00
                </p>
                {/* <label className='giftOrderLabel' htmlFor="radio">This order contains a gift
                <input className='giftRadio' type="checkbox" value="This order contains a gift"/>
                </label> */}
                <button className="checkoutBtn">Checkout</button>
            </div>
            
            {/* <ul className="upperCartFooter"> */}
                {/* <p className='backToTopP'>Back to top</p> */}
            {/* </ul> */}
            {/* <ul className="cartFooter"> */}
                {/* <div className="loginLinks">
                <span className="loginGit">
                    <a href="https://github.com/cfang322">
                    <img src={git} alt="github-link" />
                    </a>
                </span>
                <span className="loginLinkedin">
                    <a href="https://www.linkedin.com/in/yaqi-fang-125807250/">
                    <img src={linkedin} alt="linkedin-link" />
                    </a>
                </span>
                <p className="loginLinkP">Home</p>
                </div> */}
            {/* </ul> */}
        </div>
    );
};

export default CartIndex;