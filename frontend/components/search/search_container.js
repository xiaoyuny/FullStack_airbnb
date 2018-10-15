import { connect } from 'react-redux';
import SearchIndex from './search';

import { fetchListings } from '../../actions/listing_actions';
import { updateFilter } from '../../actions/filter_actions';

const MapStateToProps = state => ({
  listings: Object.values(state.entities.listings)
});

const MapDispatchToProps = dispatch => ({
  fetchListings: (filter) => dispatch(fetchListings(filter)),
  updateFilter: (filter, value) => dispatch(updateFilter(filter, value))
});

export default connect(MapStateToProps, MapDispatchToProps)(SearchIndex);