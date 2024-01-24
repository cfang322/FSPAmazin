import csrfFetch from './csrf';
import { fetchCart } from './cartItem';
// still works w/o it
// import { fetchProducts } from './product';

const SET_USER = "session/setUser";
const REMOVE_USER = "session/removeUser";

const setUser = (user) => {
    return {
        type: SET_USER,
        payload: user
    };
};

const removeUser = () => {
    return {
        type: REMOVE_USER
    };
};

const storeCSRFToken = response => {
    const csrfToken = response.headers.get("X-CSRF-Token");
    if (csrfToken) sessionStorage.setItem("X-CSRF-Token", csrfToken);
};

export const restoreSession = () => async dispatch => {
    const response = await csrfFetch("/api/session");
    storeCSRFToken(response);
    const data = await response.json();
    dispatch(setUser(data.user));
    dispatch(fetchCart());
    // still works w/o it for some reason
    // dispatch(fetchProducts());
    return response;
};

export const login = ({ credential, password }) => async dispatch => {
    try {
        const response = await csrfFetch("/api/session", {
            method: "POST",
            body: JSON.stringify({ credential, password })
        });
        // Check if the response status is ok
        if (!response.ok) {
            // Handle error status (e.g., unauthorized)
            const errorData = await response.json();
            throw errorData;
        }
        const data = await response.json();
        dispatch(setUser(data.user));
        dispatch(fetchCart());
        // dispatch(fetchProducts());
        return response;
        } catch (error) {
            // Handle any login errors
            console.error("Login error:", error);
            throw error; // Rethrow the error for further handling if needed
        }
};

export const signup = (user) => async (dispatch) => {
    const { username, email, password } = user;
    const response = await csrfFetch("/api/users", {
        method: "POST",
        body: JSON.stringify({
            username,
            email,
            password
        })
    });
    const data = await response.json();
    dispatch(setUser(data.user));
    return response;
};

export const logout = () => async (dispatch) => {
    const response = await csrfFetch("/api/session", {
        method: "DELETE"
    });
    dispatch(removeUser());
    return response;
};

const initialState = { user: null };

const sessionReducer = (state = initialState, action) => {
    switch (action.type) {
        case SET_USER:
            return { ...state, user: action.payload };
        case REMOVE_USER:
            return { ...state, user: null };
        default:
            return state;
    }
};

export default sessionReducer;