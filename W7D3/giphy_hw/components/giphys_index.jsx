import React from 'react';

import GiphysIndexItem from './giphys_index_item';

import giphysSearch from './giphys_search'; 

//giphys is coming from giphys _earch
// giphys is an array of gifs 
// calling in GiphysIndexItem componnent for each item in the array and passing in that giphy as a prop
function GiphysIndex({ giphys }) {
  return (
    <ul>
      { giphys.map(giphy => <GiphysIndexItem key={giphy.id} giphy={giphy} />) }
    </ul>
  );
}

export default GiphysIndex; 


