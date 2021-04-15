class Category < ApplicationRecord
    has_many :gym_categories
    has_many :gyms, through: :gym_categories
    has_many :trainer_categories
    has_many :trainers, through: :trainer_categories
end
