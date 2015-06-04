class Option < ActiveRecord::Base
  has_and_belongs_to_many :posts
  has_many :picks, dependent: :destroy
  has_many :picking_users, :through => :picks, :source => :user
  validates :option_text, presence: true
  validates :option_text, length: { in: 1...21}
end
