class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :picks
  has_many :picked_options, :through => :picks, :source => :option

#validates handle/email are not duplicates, and all info is present and of
#proper length and format

  validates_uniqueness_of :handle, :email, case_sensitive: false, :message =>
  "THAT USERNAME AND/OR EMAIL HAS ALREADY BEEN TAKEN"
  validates :handle, :fname, :lname, :email, presence: true
  validates :handle, :fname, :lname, length: {in: 1...18, :message =>
  "OOPS, LOOKS LIKE YOU ENTERED TOO LONG OF A USERNAME, FIRST NAME, OR LAST NAME"}
  validates :handle, format: { with: /\A[a-zA-Z0-9]+\Z/,
    :message => "ONLY LETTERS/NUMBERS ALLOWED IN USERNAME"  }



# before a user is created, set the handle/email to downcase for login purposes

  before_create do self.handle.downcase! end
  before_create do self.email.downcase! end

  def send_password_reset
   UserMailer.password_reset(self).deliver
  end



end
