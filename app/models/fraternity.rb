class Fraternity < ActiveRecord::Base
  attr_accessible :name, :greek_name

	has_many :users

end
