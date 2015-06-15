class Pick < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :option, dependent: :destroy
end
