class Menu < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :category
end
