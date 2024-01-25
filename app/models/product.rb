class Product < ApplicationRecord
    validates :name, :category, :description, :price, presence: true
    validates :rating, inclusion: {in: 1..5}, presence: true
    
    has_one_attached :photo
end
