class PairingsController < ApplicationController

  def create
    translated = JSON.parse(params[:pairing])
    Pairing.create(first_person_id: translated[0], second_person_id: translated[1])
    render :nothing => true
  end

  def new
    User.all.shuffle.each_slice(2) {|sl| Pairing.create(first_person_id: sl[0].id, second_person_id: sl[1].id)}
    render text: Pairing.all.to_s
  end

  def show
    user_search_id = User.find_by(name: params[:name]).id
    if Pairday.exists?(date: today)
      render json: User.find(search_both_columns(user_search_id)) if search_both_columns(user_search_id)
    else
      pd = Pairday.create(date: today)
      User.all.shuffle.each_slice(2) {|sl| Pairing.create(first_person_id: sl[0].id, second_person_id: sl[1].id, pairday_id: pd.id)}
      render json: User.find(search_both_columns(user_search_id)) if search_both_columns(user_search_id)
    end
  end

  def current_pairday_id
    Pairday.find_by(date: today).id
  end

  def today
    Time.now.strftime('%Y%m%d')
  end

  def search_both_columns(user_id)
    first_person_found = Pairing.find_by(pairday_id: current_pairday_id, first_person_id: user_id)
    return first_person_found.second_person_id if first_person_found
    second_person_found = Pairing.find_by(pairday_id: current_pairday_id, second_person_id: user_id)
    return second_person_found.first_person_id if second_person_found
    nil
  end
end
