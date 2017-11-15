import React from 'react';

//giphy is being passed in from the giphys_index 
// how do we know what to pass in here?!??!? 

function GiphysIndexItem({ giphy }) {
  return (
    <li className="giphy-li">
      <img src={giphy.images.fixed_height.url} />
    </li>
  );
}

export default GiphysIndexItem;