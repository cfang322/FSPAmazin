json.extract! @product, :id, :name, :description, :price, :category, :rating

json.photoUrl @product.photos.attached? ? @product.photos.first.url : nil

json.description @product.description.split("\n")