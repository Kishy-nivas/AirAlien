class Room < ApplicationRecord
  belongs_to :user
  validates :home_type, presense: true 
  validates :room_type, presense: true 
  validates :accommodate, presense: true 
  validates :bed_room, presense: true 
  validates :bath_room, presense: true 
  validates :listing_name, presense: true,length: { maximum: 50 }
  validates :summary, presense: true ,length: {maximum: 500}
  validates :address, presense: true 


end
