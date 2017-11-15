import React from 'react';

import GiphysIndex from './giphys_index';

class giphysSearch extends React.Component {
  constructor() {
    super();
    this.state = { searchTerm: ''};           // this doesn't have to be spelled out here, line 15 would've created it. 
    this.handleChange = this.handleChange.bind(this); 
    this.handleSubmit = this.handleSubmit.bind(this); 
  }

  handleChange(e) {
    e.preventDefault(); 
    this.setState({searchTerm: e.target.value}); 
  }

  handleSubmit(e) {
    e.preventDefault(); 
    this.props.fetchSearchGiphys(this.state.searchTerm); 
  }

  render () {
    return (
      <div>
        <form>
          <label >Enter Search</label>
          <input type="text" onChange={ this.handleChange }/>
          <input type="submit" onClick={ this.handleSubmit }/>
        </form>
        <GiphysIndex giphys={this.props.giphys} />
      </div>
    ); 
  }
}

export default giphysSearch; 