json.array! @products do |product|
    json.extract! product, :id, :name, :price, :rating
    json.photoUrl product.photo.attached? ? product.photo.url : nil
end
