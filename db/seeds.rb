# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do 
    puts "Destroying tables..."
    # Unnecessary if using `rails db:seed:replant`
    User.destroy_all
    
    puts "Resetting primary keys..."
    # For easy testing, so that after seeding, the first `User` has `id` of 1
    ApplicationRecord.connection.reset_pk_sequence!('users')
    
    puts "Creating users..."
    # Create one user with an easy to remember username, email, and password:
    User.create!(
        username: 'Demo-lition', 
        email: 'demo@user.io', 
        password: 'password'
    )
    
    # More users
    10.times do 
        User.create!({
            username: Faker::Internet.unique.username(specifier: 3),
            email: Faker::Internet.unique.email,
            password: 'password'
        }) 
    end
    
    puts "Creating products..."
    # Products
    Product.create(
        name: 'Latest Smartphone Pro',
        description: 'Cutting-edge smartphone with advanced features and enhanced performance.',
        price: 899.99,
        category: 'Electronics',
        rating: 5
    )
    
    Product.create(
        name: 'Chart-Topping Novel',
        description: 'An acclaimed bestseller that captivates readers with its compelling narrative.',
        price: 24.99,
        category: 'Books',
        rating: 4
    )
    
    Product.create(
        name: '4K Smart LED TV',
        description: 'Immerse yourself in stunning visuals with our state-of-the-art 4K Smart TV.',
        price: 1399.99,
        category: 'Electronics',
        rating: 4
    )
    
    Product.create(
        name: 'Culinary Masterpiece Collection',
        description: 'Explore the world of cooking with this curated collection of gourmet cookbooks.',
        price: 59.99,
        category: 'Books',
        rating: 2
    )
    
    Product.create(
        name: 'Wireless In-Ear Monitors',
        description: 'Experience unparalleled sound quality and freedom with our in-ear monitors.',
        price: 89.99,
        category: 'Electronics',
        rating: 4
    )
    
    Product.create(
        name: 'Epic Sci-Fi Trilogy',
        description: 'Embark on a thrilling journey with this captivating sci-fi trilogy.',
        price: 29.99,
        category: 'Books',
        rating: 5
    )
    
    Product.create(
        name: 'Smart Health Tracker Watch',
        description: 'Monitor your health and stay connected with our advanced smartwatch.',
        price: 159.99,
        category: 'Electronics',
        rating: 4
    )
    
    Product.create(
        name: 'Exotic Coffee Blend',
        description: 'Indulge in the rich flavors of our exotic gourmet coffee blend.',
        price: 22.99,
        category: 'Groceries',
        rating: 4
    )
    
    Product.create(
        name: 'Premium Noise-Canceling Headset',
        description: 'Immerse yourself in a world of music with our premium noise-canceling headphones.',
        price: 149.99,
        category: 'Electronics',
        rating: 5
    )
    
    Product.create(
        name: 'Twisted Mystery Novel',
        description: 'Uncover dark secrets and suspense in this gripping twisted mystery novel.',
        price: 21.99,
        category: 'Books',
        rating: 4
    )
    
    
    puts "Done!"
end