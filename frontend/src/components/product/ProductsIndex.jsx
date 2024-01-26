import { useDispatch, useSelector } from 'react-redux';
import { useEffect } from 'react';
import { NavLink } from 'react-router-dom';
import { fetchProducts, selectProductsArray } from '../../store/product';
import './ProductsIndex.css';
import Rating from './Rating';

function ProductsIndex() {
    const dispatch = useDispatch();
    const products = useSelector(selectProductsArray);
    
    useEffect(() => {
        dispatch(fetchProducts());
    }, [dispatch]);
    
    return (
        <ul className='productsIndexPage'>
            <div className="productsIndexDivider"></div>
            <div className="productsContainer">
                {products.map((product, index) => (
                    <NavLink key={`${product.id}_${index}`} to={`/products/${product.id}`}>
                        <div className="productContainer">
                            <img className="productImage" src={product.photoUrl} alt={product.name} />
                            <div className="containerContent">
                                <p className='productName'>{product.name}</p>
                                <Rating rating={product.rating} />
                                <p className='productPrice'>${product.price}</p>
                            </div>
                        </div>
                    </NavLink>
                ))}
            </div>
        </ul>
    );
}

export default ProductsIndex;