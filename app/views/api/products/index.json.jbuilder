# json.array! @products do |product|
#     json.extract! product, :id, :name, :price, :rating
#     json.photoUrl product.photo.attached? ? product.photo.url : nil
# end

@products.each do |product|
    json.set! product.id do
        json.extract! product, :id, :name, :price, :rating
        json.photoUrl product.photo.attached? ? product.photo.url : nil
        
    end
end
