require 'spec_helper'

describe MoviesController do
  describe 'Find Movies With Same Director' do
    it 'should call model method that performs director search' do
      fake_results = [mock('Movie'), mock('Movie')]
      Movie.should_receive(:find_all_by_director).with('hardware').
        and_return(fake_results)
      post :find_similiar, {:director => 'hardware'}
    end
  end
end

