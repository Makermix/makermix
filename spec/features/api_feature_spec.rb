require 'rails_helper'

feature 'api calls' do
  context 'to the cohorts route' do
    scenario 'returns a cohort of users if given a cohort id' do
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

    scenario 'returns a list of cohorts if not given a cohort id' do
      cohort1 = Cohort.create(name: 'March 2015')
      cohort2 = Cohort.create(name: 'April 2015')
      get "/cohorts"
      expect(JSON.parse(last_response.body)[0]['name']).to eq(cohort1.name)
      expect(JSON.parse(last_response.body)[1]['name']).to eq(cohort2.name)
    end
  end

  context 'to the pair path' do

    scenario 'returns the specified user\'s pair partner for the day' do
      get '/pair/james'
      expect(last_response.body).to eq('Milena')
    end

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

