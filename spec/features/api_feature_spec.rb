require 'rails_helper'

feature 'api' do
  context 'making a get request to the api with the correct params' do
    scenario 'returns you the request json object' do
      cohort = Cohort.create(name: "March 2015")
      cohort.users.create(name: "James")
      get "/cohorts/#{cohort.id}"
      expect(JSON.parse(last_response.body)['id']).to eq(cohort.id)
      expect(JSON.parse(last_response.body)['users'][0]['name']).to eq('James')
    end

    scenario 'returns 404 page if requested cohort does not exist' do
      get "/cohorts/1"
      expect(last_response.status).to eq(404)
    end
  end
end
