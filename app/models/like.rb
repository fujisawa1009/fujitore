class Like < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :trainer, optional: true
  validates_uniqueness_of :trainer_id, scope: :user_id
end
