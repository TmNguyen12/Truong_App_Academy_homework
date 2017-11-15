import React from 'react';
import { Provider } from 'react-redux'; // gives every componnent access to the store 

import GiphysSearchContainer from './giphys_search_container';

const Root = ({ store }) => {
  return (
    <Provider store={ store }> 
      <GiphysSearchContainer />
    </Provider> 
  ); 
};

export default Root; 

