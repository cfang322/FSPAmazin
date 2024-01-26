import { useParams, useNavigate } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { useEffect, useState } from "react";
import { fetchProduct, selectProduct } from "../../store/product";
import { createCartItem, memoizedSelectCartItems, updateCartItem } from "../../store/cartItem";
import "./ItemIndex.css";
import Rating from "./Rating";

const ItemIndex = () => {
  const dispatch = useDispatch();
  const { productId } = useParams();
  const product = useSelector(selectProduct(productId));
  const cartItems = useSelector(memoizedSelectCartItems);
  const product_id = parseInt(productId);
  const [quantity, setQuantity] = useState(1);
  const sessionUser = useSelector((state) => state.session.user);
  const navigate = useNavigate();
  
  useEffect(() => {
    dispatch(fetchProduct(productId));
  }, [dispatch, productId]);
  // if the product is not yet available or if the description is not an array
  if (!product) {
    return <div>Loading...</div>;
  }
  // if product.description is not an array or is empty
  if (!Array.isArray(product.description) || product.description.length === 0) {
    return <div>No description available</div>;
  }
  
  const parsedDescription = JSON.parse(product.description[0]);
  
  const handleAddCartItem = async (e) => {
    e.preventDefault();
    if (sessionUser) {
      const user_id = sessionUser.id;
      const productToAdd = { quantity, product_id, user_id };
      const existingCartItem = cartItems.find(
        (item) => item.productId === product.id
      );
      if (existingCartItem) {
        const updatedCartItem = {
          ...existingCartItem,
          quantity: existingCartItem.quantity + quantity,
        };
        dispatch(updateCartItem(updatedCartItem));
      } else {
        dispatch(createCartItem(productToAdd));
      }
    } else {
      navigate("/login");
    }
  };
  
  const handleQuantityChange = (e) => setQuantity(parseInt(e.target.value, 10));
  
  return (
    <div className="itemIndexPage">
      <div className="itemImageContainer">
        <img className="productImage" src={product.photoUrl} alt={product.name} />
        {/* <img src={placeholder} alt={product.name} /> */}
      </div>
      <div className="itemContentContainer">
        <div className="middleProductPriceContainer">
          <h3 className="middleProductPriceText">{product.name}</h3>
        </div>
        <div className='reviewContainer'>
          <div className='reviewItemsDiv'><Rating rating={product.rating} /></div>
        </div>
        <div className="middleDivider2"></div>
          <div className="middleProductPriceContainer">
            <p className="middleProductPriceText">${product.price}</p>
          </div>
        <div>
          <div className="middleDivider1"></div>
          <p className="aboutItemTag">About this item:</p>
          <ul className="productDetailList">
            {parsedDescription.map((detail, index) => (
              <li className="productDetail" key={`${product.id}_${index}`}>
                {detail}
                <br/>
                <br/>
              </li>
            ))}
          </ul>
        </div>
      </div>
      
      <div className="addToCartContainer">
        <div className="buyNew">
          <h3>Buy new:</h3>
        </div>
        <div className="productPriceContainer">
          <h1 className="productPriceText">${product.price}</h1>
        </div>
        <div className="inStockContainer">
          <h1 className="inStockText">In Stock</h1>
        </div>
        <div className="quantityContainer">
          <span>Quantity: </span>
          <select
            className="quantityDropDown"
            name="quantity"
            value={quantity}
            onChange={handleQuantityChange}
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
        </div>
        <div className="addToCartButton">
          <button onClick={handleAddCartItem} className="addToCartBtn">
            Add to cart
          </button>
        </div>
      </div>
    </div>
  );
};

export default ItemIndex;


{/* <ul className="upperProductFooter">
{/* <p className='backToTopP'>Back to top</p> */}
// </ul>
{/* <ul className="productFooter">
<div className="loginLinks">
  <span className="loginGit">
    <a href="https://github.com/cfang322">
      <img src={git} alt="git-link" />
    </a>
  </span>
  <span className="loginLinkedin">
    <a href="https://www.linkedin.com/in/yaqi-fang-125807250/">
      <img src={linkedin} alt="linkedin-link" />
    </a>
  </span>
  <div className="backToHome">
    <NavLink to="/">
      <p className="loginLink">Back to Home</p>
    </NavLink>
  </div>
</div> */}
// </ul> 