class District < ApplicationRecord
    
    has_many :gyms
    accepts_nested_attributes_for :gyms, allow_destroy: true

    has_many :trainer_districts
    has_many :trainers, through: :trainer_districts
    accepts_nested_attributes_for :trainer_districts, allow_destroy: true

end
