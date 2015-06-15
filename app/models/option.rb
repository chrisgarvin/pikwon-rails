class Option < ActiveRecord::Base
  has_and_belongs_to_many :posts, dependent: :destroy
  has_many :picks, dependent: :destroy
  has_many :picking_users, :through => :picks, :source => :user, dependent: :destroy

#validates that option_text is not blank and between 1 & 22 characters

  validates :option_text, presence: true
  validates :option_text, length: { in: 1...23}
end
