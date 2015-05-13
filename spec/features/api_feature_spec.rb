require 'rails_helper'

feature 'api' do
  context 'making a get request to the api with the correct params' do
    scenario 'returns you the request json object' do
      cohort = Cohort.create(name: "March 2015")
      cohort.users.create()
      get "/cohorts/#{cohort.id}"
      expect(last_response.body).to eq(cohort.to_json)
    end
  end
end
