class GymCategory < ApplicationRecord
    belongs_to :gym, optional: true
    belongs_to :category, optional: true
end
