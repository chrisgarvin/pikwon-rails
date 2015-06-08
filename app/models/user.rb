class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :picks
  has_many :picked_options, :through => :picks, :source => :option

#validates handle/email are not duplicates, and all info is present and of
#proper length and format

  validates_uniqueness_of :handle, :email, case_sensitive: false
  validates :handle, :fname, :lname, :email, presence: true
  validates :handle, :fname, :lname, length: {in: 1...18}
  validates :handle, format: { with: /\A[a-zA-Z0-9]+\Z/ }


# before a user is created, set the handle/email to downcase for login purposes

  before_create do self.handle.downcase! end
  before_create do self.email.downcase! end
end
