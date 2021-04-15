class TrainerDistrict < ApplicationRecord
  belongs_to :trainer, optional: true
  belongs_to :district, optional: true
end
