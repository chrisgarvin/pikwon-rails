class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :picks
  has_many :picked_options, :through => :picks, :source => :option
end
