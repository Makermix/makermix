class Pairing < ActiveRecord::Base
  has_many :participants, through: :users
end
