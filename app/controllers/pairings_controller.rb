class PairingsController < ApplicationController

  def create
    translated = JSON.parse(params[:pairing])
    Pairing.create(first_person_id: translated[0], second_person_id: translated[1])
    render :nothing => true
  end
end
