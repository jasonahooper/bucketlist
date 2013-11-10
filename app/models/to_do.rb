class ToDo < ActiveRecord::Base
  belongs_to :destination
  geocoded_by :geocode_full

  after_validation :geocode

  private
    def geocode_full
      "#{where} #{destination.name}"
    end
end
