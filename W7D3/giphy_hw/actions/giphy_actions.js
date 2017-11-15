import * as APIUtil from '../util/api_util';

export const RECEIVE_SEARCH_GIPHYS = 'RECEIVE_SEARCH_GIPHYS'; 
export const REQUEST_SEARCH_GIPHYS = 'REQUEST_SEARCH_GIPHYS';

// function that takes in a parameter and returns an action object that has the type and the parameter as the payload 
export const receiveSearchGiphys = giphys => {
  return {
    type: RECEIVE_SEARCH_GIPHYS, 
    giphys
  };
};

export const fetchSearchGiphys = (searchTerm) => {
	return (dispatch) => {
		APIUtil.fetchSearchGiphys(searchTerm)
			.then(giphys => dispatch(receiveSearchGiphys(giphys.data))); //giphy is the response that is returned from the API call 
	};
};

// common pattern in thunk is it is dispatching the regular action creator that you defined above 



