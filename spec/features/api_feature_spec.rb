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

end
