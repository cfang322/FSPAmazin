import { NavLink, useNavigate } from "react-router-dom";
import { useSelector, useDispatch } from "react-redux";
import * as sessionActions from "../../store/session";
import { memoizedSelectCartItems } from "../../store/cartItem";
import "./Navigation.css";
import logo from "../../images/logo.png";
import cart from "../../images/cart.png";
import { useEffect } from "react";
import { fetchCart } from "../../store/cartItem";

function Navigation() {
  const sessionUser = useSelector((state) => state.session.user);
  const dispatch = useDispatch();
  const cartItems = useSelector(memoizedSelectCartItems);
  const navigate = useNavigate();

  const logout = (e) => {
    e.preventDefault();
    dispatch(sessionActions.logout());
    
    navigate("/");
  };
  
  useEffect(() => {
    if (sessionUser) {
      dispatch(fetchCart());
    }
  }, [dispatch, sessionUser]);
  
  const totalCount = cartItems.reduce(
    (total, item) => total + item.quantity,
    0
  );
  
  const sessionLinks = sessionUser ? (
    <ul>
      <li>
        <button className="dropdwnSignoutBtn" onClick={logout}>
          Log Out
        </button>
      </li>
    </ul>
  ) : (
    <ul>
      <li className="dropdwnSign">
        <NavLink id="dropdwnLoginBtn" to="/login">
          Log in
        </NavLink>
      </li>
      <li>
        <NavLink id="signup" to="/signup">
          New costumer? Start here
        </NavLink>
      </li>
    </ul>
  );

  return (
    <>
      <div className="navBar">
        <div className="home">
          <NavLink to="/">
            <img src={logo} alt="amazon-logo" />
          </NavLink>
        </div>

        <li className="dropdown">
          <button className="dropbtn">
            {sessionUser ? `Hello, ${sessionUser.username}` : "Hello, sign in"}
          </button>
          <div className="dropdown-content">{sessionLinks}</div>
        </li>

        <div className="cart">
          <NavLink to="cart" id="cartLink">
            <p className="cartNumber">{totalCount}</p>
            <img src={cart} alt="cart-img" />
            <p className="cartWord">Cart</p>
          </NavLink>
        </div>
      </div>

      <div className="secondBar">
        <NavLink to="products" id="productsLink">
          <p className="ProductIndexLink">Shop Now</p>
        </NavLink>
      </div>
    </>
  );
}

export default Navigation;
