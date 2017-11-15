import { connect } from 'react-redux';
import GiphysSearch from './giphys_search';
import { fetchSearchGiphys } from '../actions/giphy_actions';

// state is the store that was passed in by the provider from root 
const mapStateToProps = state => ({giphys: state.giphys});      // creating an object of props for that specific slice of state

const mapDispatchToProps = dispatch => {
  return { fetchSearchGiphys: (searchTerm) => dispatch(fetchSearchGiphys(searchTerm)) };
};

export default connect(mapStateToProps, mapDispatchToProps)(GiphysSearch);

