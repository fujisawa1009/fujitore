class Comment < ApplicationRecord
  validates :title, presence: true
  belongs_to :user, optional: true
  belongs_to :gym, optional: true
  belongs_to :trainer, optional: true
end
