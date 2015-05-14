require 'rails_helper'

feature 'pairing' do

  context 'to the pair path' do
    scenario 'returns the specified user\'s pair partner for the day' do
      get '/pair/james'
      expect(last_response.body).to eq('Milena')
    end
  end
end
