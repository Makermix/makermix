class PairingsController < ApplicationController

  def create
    translated = JSON.parse(params[:pairing])
    Pairing.create(first_person_id: translated[0], second_person_id: translated[1])
    render :nothing => true
  end

  def new
    User.all.shuffle.each_slice(2) {|sl| Pairing.create(first_person_id: sl[0].id, second_person_id: sl[1].id)}
    render :nothing => true
  end
end
