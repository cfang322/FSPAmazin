import { createSelector } from 'reselect';

export const RECEIVE_PRODUCTS = 'products/RECEIVE_PRODUCTS';
export const RECEIVE_PRODUCT = 'products/RECEIVE_PRODUCT';

export const receiveProducts = (products) => ({
    type: RECEIVE_PRODUCTS,
    products
});
export const receiveProduct = (product) => ({
    type: RECEIVE_PRODUCT,
    product
});

// export const selectProductsArray = (state) => Object.values(state.products);
const selectProductsState = (state) => state.products;
export const selectProductsArray = createSelector(
    [selectProductsState],
    (products) => Object.values(products)
);
export const selectProduct = (productId) => (state) => state?.products[productId] || null;

export const fetchProducts = () => async (dispatch) => {
    const response = await fetch("/api/products");
    const productData = await response.json();
    dispatch(receiveProducts(productData));
};

export const fetchProduct = (productId) => async (dispatch) => {
    const response = await fetch(`/api/products/${productId}`);
    const productData = await response.json();
    dispatch(receiveProduct(productData));
};

const productReducer = (state = {}, action) => {
    const newState = { ...state };
    switch (action.type) {
    case RECEIVE_PRODUCTS:
        return action.products;
    case RECEIVE_PRODUCT:
        newState[action.product.id] = action.product;
        return newState;
    default:
        return state;
    }
};

export default productReducer;