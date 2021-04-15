class GymTrainer < ApplicationRecord
  belongs_to :gym, optional: true
  belongs_to :trainer, optional: true
end
