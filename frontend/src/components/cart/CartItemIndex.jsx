import { NavLink } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { useState } from "react";
import { selectProduct } from "../../store/product";
import { updateCartItem, deleteCartItem } from "../../store/cartItem";
import "./CartItemIndex.css";

const CartItemIndex = ({ cartItem }) => {
    const product = useSelector(selectProduct(cartItem.productId));
    const dispatch = useDispatch();
    const [quantity, setQuantity] = useState(cartItem.quantity);
    const sessionUser = useSelector((state) => state.session.user);
    
    if (!product) return null;
    
    const deleteItem = (e) => {
        e.preventDefault();
        dispatch(deleteCartItem(cartItem.id));
    };
    const quantityHandler = (e) => {
        const updatedQuantity = parseInt(e.currentTarget.value);
        const updatedCartItem = {
            id: cartItem.id,
            quantity: updatedQuantity,
            userId: sessionUser.id,
            productId: product.id,
        };
        setQuantity(updatedQuantity);
        dispatch(updateCartItem(updatedCartItem));
    };
    
    return (
        <div className="cartItemsIndexDiv">
            <div className="cartItem" key={cartItem.id}>
                <NavLink to={`/products/${product.id}`}>
                    <div className="cartItemImgDiv">
                        <img className="productImage" src={product.photoUrl} alt={product.name} />
                    </div>
                </NavLink>
                <div className="hi">
                    <div className="cartProductNameDiv">
                        <NavLink to={`/products/${product.id}`}>
                            <h1 className="cartItemNameH1">{product.name}</h1>
                        </NavLink>
                    </div>
                    <div className="cartItemPriceDiv">
                        <h1 className="cartItemPriceH1">{product.price}</h1>
                    </div>
                    <div className="cartItemQuantityDiv">
                        <span className="cartItemQtySpan">Qty:</span>
                        <select
                            value={quantity}
                            className="quantityCartItemDropdown"
                            id="quantityCartItem"
                            onChange={quantityHandler}
                        >
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                        </select>
                        <span className="deleteLink" onClick={deleteItem}>Delete</span>
                    </div>
                </div>
            </div>
        <div className="cartItemIndexDivider"></div>
        </div>
    );
};

export default CartItemIndex;