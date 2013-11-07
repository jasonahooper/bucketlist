class Destination < ActiveRecord::Base
  belongs_to :traveller
  has_many :to_dos
end
