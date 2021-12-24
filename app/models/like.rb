class Like < ApplicationRecord
  belongs_to :test
  belongs_to :user
  validates_uniqueness_of :test_id, scope: :user_id
end
