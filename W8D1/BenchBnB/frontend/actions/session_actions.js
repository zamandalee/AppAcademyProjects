import * as SessionAPIUtil from '.././util/session_api_util';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';

export const login = (user) => (dispatch) => {
  return SessionAPIUtil.login(user).then( result => {
    dispatch(receiveCurrentUser(result));
  }), err => (
    dispatch(receiveErrors(err.responseJSON))
  );
};

export const logout = () => (dispatch) => {
  return SessionAPIUtil.logout().then( result => {
    dispatch(receiveCurrentUser(null));
  }), err => (
    dispatch(receiveErrors(err.responseJSON))
  );
};

export const signup = (user) => (dispatch) => {
  return SessionAPIUtil.signup().then( result => {
    dispatch(receiveCurrentUser(result));
  }), err => (
    dispatch(receiveErrors(err.responseJSON))
  );
};

export const receiveCurrentUser = (currentUser) => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
});

export const receiveErrors = (errors) => ({
  type: RECEIVE_ERRORS,
  errors
});

export const logoutCurrentUser = () => ({
  type: LOGOUT_CURRENT_USER,
});
