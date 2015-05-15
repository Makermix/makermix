class PairingsController < ApplicationController

  def today_date
    Time.now.strftime('%Y%m%d')
  end

  def create_pairday
    Pairday.create(date: today_date).id
  end

  def make_pair(pair)
    Pairing.create(first_person_id: pair[0].id, second_person_id: sl[1].id, pairday_id: create_pairday)
  end

  def new
    User.all.shuffle.each_slice(2) {|sl| make_pair(sl)}
    render text: Pairing.all.to_s
  end

  def today_pairday_id
    Pairday.find_by(date: today_date).id
  end

  def search_both_columns(user_id)
    first_person_found = Pairing.find_by(pairday_id: today_pairday_id, first_person_id: user_id)
    second_person_found = Pairing.find_by(pairday_id: today_pairday_id, second_person_id: user_id)
    return first_person_found.second_person_id if first_person_found
    return second_person_found.first_person_id if second_person_found
    nil
  end

  def user_search_id
    User.find_by(name: params[:name]).id
  end
  
  def show
    if Pairday.exists?(date: today_date)
      render json: User.find(search_both_columns(user_search_id)) if search_both_columns(user_search_id)
    else
      User.all.shuffle.each_slice(2) {|sl| Pairing.create(first_person_id: sl[0].id, second_person_id: sl[1].id, pairday_id: create_pairday)}
      render json: User.find(search_both_columns(user_search_id)) if search_both_columns(user_search_id)
    end
  end
end
