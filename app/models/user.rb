class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :picks
  has_many :picked_options, :through => :picks, :source => :option

  validates_uniqueness_of :handle, :email, case_sensitive: false

# before a user is created, set the handle to downcase for login purposes

  before_create do self.handle.downcase! end
end
