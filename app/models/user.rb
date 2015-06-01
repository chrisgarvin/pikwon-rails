class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :picks
  has_many :picked_options, :through => :picks, :source => :option

# before a user is created, set the handle to downcase for login purposes

  before_create do self.handle.downcase! end
end
