require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# ApplicationRecord.transaction do 
    puts "Destroying tables..."
    # Unnecessary if using `rails db:seed:replant`
    User.destroy_all
    Product.destroy_all
    
    puts "Resetting primary keys..."
    # For easy testing, so that after seeding, the first `User` has `id` of 1
    ApplicationRecord.connection.reset_pk_sequence!('users')
    ApplicationRecord.connection.reset_pk_sequence!('products')
    
    puts "Creating users..."
    # Create one user with an easy to remember username, email, and password:
    User.create!(
        username: 'Demo-lition', 
        email: 'demo@user.io', 
        password: 'password'
    )
    
    # More users
    # 10.times do 
    #     User.create!({
    #         username: Faker::Internet.unique.username(specifier: 3),
    #         email: Faker::Internet.unique.email,
    #         password: 'password'
    #     }) 
    # end
    
    puts "Creating products..."
    # Products
    # product = Product.create(
    #     name: 'Latest Smartphone Pro',
    #     description: 'Cutting-edge smartphone with advanced features and enhanced performance.',
    #     price: 899.99,
    #     category: 'Electronics',
    #     rating: 5
    # )
    # product.photos.attach(
    #     io: URI.open("https://amazin-seeds.s3.amazonaws.com/aggretsuko.jpeg"), 
    #     filename: "aggretsuko.jpeg"
    # )
    
    # Product.create(
    #     name: 'Chart-Topping Novel',
    #     description: 'An acclaimed bestseller that captivates readers with its compelling narrative.',
    #     price: 24.99,
    #     category: 'Books',
    #     rating: 4
    # )
    
    # Product.create(
    #     name: '4K Smart LED TV',
    #     description: 'Immerse yourself in stunning visuals with our state-of-the-art 4K Smart TV.',
    #     price: 1399.99,
    #     category: 'Electronics',
    #     rating: 4
    # )
    
    # Product.create(
    #     name: 'Culinary Masterpiece Collection',
    #     description: 'Explore the world of cooking with this curated collection of gourmet cookbooks.',
    #     price: 59.99,
    #     category: 'Books',
    #     rating: 2
    # )
    
    # Product.create(
    #     name: 'Wireless In-Ear Monitors',
    #     description: 'Experience unparalleled sound quality and freedom with our in-ear monitors.',
    #     price: 89.99,
    #     category: 'Electronics',
    #     rating: 4
    # )
    
    # Product.create(
    #     name: 'Epic Sci-Fi Trilogy',
    #     description: 'Embark on a thrilling journey with this captivating sci-fi trilogy.',
    #     price: 29.99,
    #     category: 'Books',
    #     rating: 5
    # )
    
    # Product.create(
    #     name: 'Smart Health Tracker Watch',
    #     description: 'Monitor your health and stay connected with our advanced smartwatch.',
    #     price: 159.99,
    #     category: 'Electronics',
    #     rating: 4
    # )
    
    # Product.create(
    #     name: 'Exotic Coffee Blend',
    #     description: 'Indulge in the rich flavors of our exotic gourmet coffee blend.',
    #     price: 22.99,
    #     category: 'Groceries',
    #     rating: 4
    # )
    
    # Product.create(
    #     name: 'Premium Noise-Canceling Headset',
    #     description: 'Immerse yourself in a world of music with our premium noise-canceling headphones.',
    #     price: 149.99,
    #     category: 'Electronics',
    #     rating: 5
    # )
    
    # Product.create(
    #     name: 'Twisted Mystery Novel',
    #     description: 'Uncover dark secrets and suspense in this gripping twisted mystery novel.',
    #     price: 21.99,
    #     category: 'Books',
    #     rating: 4
    # )
    product = Product.create(
        name: 'Ultra HD Smart TV',
        description: [
          'Experience stunning visuals with our Ultra HD Smart TV.',
          'Immersive Dolby Atmos sound for a cinematic experience.',
          'Smart TV features for seamless streaming.',
          'Sleek design that enhances any living space.',
          'Multiple HDMI and USB ports for versatile connectivity.',
          'Voice control for hands-free operation.',
          'Energy-efficient LED technology for eco-friendly viewing.',
          'Includes a remote with smart functionality.',
          'Easy setup and user-friendly interface.'
        ],
        price: 1299.99,
        category: 'Electronics',
        rating: 4
        )
        
        product.photos.attach(
            io: URI.open("https://amazin-seeds.s3.amazonaws.com/aggretsuko.jpeg"), 
            filename: "aggretsuko.jpeg"
        )
    
        
        Product.create(
        name: 'Cookbook Collection',
        description: [
          'Unlock your culinary skills with this collection of popular cookbooks.',
          'Variety of recipes from different cuisines.',
          'Step-by-step instructions for easy cooking.',
          'Beautifully illustrated with mouth-watering photos.',
          'Nutritional information for mindful cooking.',
          'Tips and tricks from renowned chefs.',
          'Suitable for beginners and experienced cooks alike.',
          'Hardcover edition for durability.',
          'Perfect gift for food enthusiasts.'
        ],
        price: 49.99,
        category: 'Books',
        rating: 1
        )
        
        Product.create(
        name: 'Wireless Bluetooth Earbuds',
        description: [
          'Enjoy high-quality sound and wireless freedom with our Bluetooth earbuds.',
          'Long-lasting battery life for extended usage.',
          'Comfortable fit with noise isolation technology.',
          'Intuitive touch controls for easy operation.',
          'Water-resistant for active lifestyles.',
          'Portable charging case for on-the-go convenience.',
          'Bluetooth 5.0 for stable and fast connectivity.',
          'Built-in microphone for hands-free calls.',
          'Compatible with iOS and Android devices.'
        ],
        price: 79.99,
        category: 'Electronics',
        rating: 3
        )
        
        Product.create(
        name: 'Sci-Fi Adventure Novel',
        description: [
          'Embark on an epic sci-fi journey with this thrilling adventure novel.',
          'Futuristic world-building that captivates the imagination.',
          'Dynamic characters facing intergalactic challenges.',
          'Plot twists that keep you on the edge of your seat.',
          'Exploration of advanced technologies and civilizations.',
          'Themes of resilience and hope in the face of adversity.',
          'Action-packed scenes with laser-sharp focus.',
          'Intricate details that create a vivid fictional universe.',
          'A must-read for science fiction enthusiasts.'
        ],
        price: 24.99,
        category: 'Books',
        rating: 5
        )
        
        Product.create(
        name: 'Smartwatch',
        description: [
          'Stay connected and track your fitness with this advanced smartwatch.',
          'Built-in GPS for accurate location tracking.',
          'Health monitoring features for a holistic well-being.',
          'Customizable watch faces to suit your style.',
          'Waterproof design for all-weather wear.',
          'Long battery life for extended usage between charges.',
          'Compatible with popular fitness apps for comprehensive tracking.',
          'Receive notifications and calls directly on your wrist.',
          'Sleek and modern design that complements any outfit.'
        ],
        price: 149.99,
        category: 'Electronics',
        rating: 4
        )
        
        Product.create(
        name: 'Gourmet Coffee Beans',
        description: [
          'Experience the rich flavors of gourmet coffee with these premium beans.',
          'Single-origin beans for a distinct taste profile.',
          'Artisanally roasted for optimal flavor extraction.',
          'Packaged in a resealable bag to maintain freshness.',
          'Sustainably sourced beans for ethical consumption.',
          'Notes of chocolate, caramel, and hints of fruit.',
          'Medium-dark roast for a well-balanced cup.',
          'Suitable for various brewing methods.',
          'Perfect for coffee enthusiasts seeking quality.'
        ],
        price: 19.99,
        category: 'Groceries',
        rating: 4
        )
        
        Product.create(
        name: 'Wireless Noise-Canceling Headphones',
        description: [
          'Immerse yourself in music with these high-quality wireless headphones.',
          'Active noise-canceling technology for a serene listening experience.',
          'Over-ear design for comfortable and immersive sound.',
          'Foldable and portable for on-the-go convenience.',
          'Bluetooth connectivity for seamless pairing with devices.',
          'Long battery life for extended listening sessions.',
          'Touch controls for easy playback and volume adjustments.',
          'Premium materials for durability and comfort.',
          'Includes a travel case for protection during transit.'
        ],
        price: 129.99,
        category: 'Electronics',
        rating: 5
        )
        
        Product.create(
        name: 'Mystery Thriller Book',
        description: [
          'Unravel the secrets and suspense with this gripping mystery thriller.',
          'Twists and turns that keep you guessing until the end.',
          'Compelling characters with hidden motives.',
          'Atmospheric setting that adds to the suspense.',
          'Investigative plot filled with unexpected revelations.',
          'Themes of trust, betrayal, and redemption.',
          'Well-crafted dialogue that enhances character development.',
          'Satisfying resolution that ties up loose ends.',
          'Perfect for fans of thrilling and unpredictable mysteries.'
        ],
        price: 18.99,
        category: 'Books',
        rating: 4
    )
    
    
    puts "Done!"
# end