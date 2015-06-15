class Post < ActiveRecord::Base
  has_and_belongs_to_many :options, dependent: :destroy
  belongs_to :user, :class_name => User, :foreign_key => "user_id", dependent: :destroy
end
