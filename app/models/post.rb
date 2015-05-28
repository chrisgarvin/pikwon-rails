class Post < ActiveRecord::Base
  has_many :options
  belongs_to :user, :class_name => User, :foreign_key => "user_id"
end
