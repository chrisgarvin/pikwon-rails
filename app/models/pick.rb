class Pick < ActiveRecord::Base
  belongs_to :user
  belongs_to :option
end
