require 'rails_helper'

feature 'api calls' do
  context 'to the cohorts route' do
    scenario 'returns a cohort of users if given a cohort id' do
      cohort = Cohort.create(name: 'March 2015')
      get "/cohorts/1"
      expect(JSON.parse(last_response.body)['name']).to eq('March 2015')
    end

    scenario 'returns 404 page if requested cohort does not exist' do
      get "/cohorts/1"
      expect(last_response.status).to eq(404)
    end

    scenario 'returns a list of cohorts if not given a cohort id' do
      cohort1 = Cohort.create(name: 'March 2015')
      cohort2 = Cohort.create(name: 'April 2015')
      get "/cohorts"
      expect(JSON.parse(last_response.body)[0]['name']).to eq(cohort1.name)
      expect(JSON.parse(last_response.body)[1]['name']).to eq(cohort2.name)
    end
  end

  # context 'making a post request with users to the database' do
  #
  #   scenario 'submit the requested json object' do
  #     data = '{"name": "rich"}'
  #     post "/users", JSON.parse(data)
  #     expect(User.last.name).to have_content("rich")
  #   end
  # end

  context 'adding a pairing' do

    scenario 'submit the requested pairing' do
      user1 = User.create(name: "rich", email: "first@email.com")
      user2 = User.create(name: "tomi", email: "second@email.com")
      id1 = user1.id
      id2 = user2.id
      postdata = [id1,id2]
      post "/pairings", pairing: JSON.generate(postdata)
      expect(Pairing.last.first_person_id).to eq(id1)
      expect(Pairing.last.second_person_id).to eq(id2)
    end
  end

#   context 'login in' do
#
#     scenario 'with github' do
#       # create user
# #     make a post request with the route (and login details, params)
# #     expect user to be logged in
#     end
#
#   end

  context 'making a get request with pairings/new' do

    scenario 'shuffles if the first request' do
      user1 = User.new(name: "rich", email: "A")
      user1.save(validate: false)
      user2 = User.new(name: "tomi", email: "B")
      user2.save(validate: false)
      id1 = user1.id
      id2 = user2.id
      get 'pair/rich'
      expect(last_response.body).to eq(user2.to_json)
    end

    scenario 'returns the partner for subsequent requests' do
      user1 = User.new(name: "rich", email: "A")
      user1.save(validate: false)
      user2 = User.new(name: "tomi", email: "B")
      user2.save(validate: false)
      id1 = user1.id
      id2 = user2.id
      get 'pair/rich'
      get 'pair/tomi'
      expect(last_response.body).to eq(user1.to_json)
    end

  end
end
