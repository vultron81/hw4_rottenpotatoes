require 'spec_helper'

describe MoviesController do
  describe 'Find Movies With Same Director' do
    it 'should call model method that performs director search' do
      fake_movie = mock('Movie')
      fake_movie.stub(:director).and_return('Some Dude')
      fake_search_results = [mock('Movie'), mock('Movie')]
      Movie.should_receive(:find_by_id).with('1').
        and_return(fake_movie)
      Movie.should_receive(:find_similiar_director).with('1').
        and_return(fake_search_results)
      post :find_similiar_director, {:id => '1'}
    end
    it 'should call model method that performs director search with no results' do
      fake_movie = mock('Movie')
      fake_movie.stub(:director).and_return('')
      fake_movie.stub(:title).and_return('A movie title')
      fake_search_results = []
      Movie.should_receive(:find_by_id).with('1').
        and_return(fake_movie)
      post :find_similiar_director, {:id => '1'}
    end
  end
end

