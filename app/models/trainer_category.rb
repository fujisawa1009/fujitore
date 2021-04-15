class TrainerCategory < ApplicationRecord
  belongs_to :trainer, optional: true
  belongs_to :category, optional: true
end
