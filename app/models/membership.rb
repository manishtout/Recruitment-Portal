class Membership < ApplicationRecord
  belongs_to :role
  belongs_to :user
  belongs_to :employer
end
