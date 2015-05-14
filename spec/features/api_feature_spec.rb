require 'rails_helper'

feature 'api' do

  context 'making a get request to the api with the correct params' do

    scenario 'returns you the request json object' do
      cohort = Cohort.create(name: "March 2015")
      User.create(name: "rich")
      get "/cohorts/#{cohort.id}"
      expect(last_response.body).to eq(cohort.to_json)
    end

  end

  # context 'making a post request with users to the database' do

  #   scenario 'submit the requested json object' do
  #     data = '{"name": "rich"}'
  #     post "/users", JSON.parse(data)
  #     expect(User.last.name).to have_content("rich")
  #   end
  # end

  context 'adding a pairing' do

    scenario 'submit the requested pairing' do
      user1 = User.create(name: "rich")
      user2 = User.create(name: "tomi")
      id1 = user1.id
      id2 = user2.id
      postdata = [id1,id2]
      post "/pairings", pairing: JSON.generate(postdata)
      expect(Pairing.last.first_person_id).to eq(id1)
      expect(Pairing.last.second_person_id).to eq(id2)
    end
  end

end

