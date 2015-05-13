require 'rails_helper'

feature 'api' do
  context 'making a get request to the api with the correct params' do
    scenario 'returns you the request json object' do
      get '/cohorts/1'
      expect(last_response.body).to eq("Hello world, you asked to view cohort with id 1")
    end
  end
end