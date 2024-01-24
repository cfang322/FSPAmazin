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
    # Product 1
    product = Product.create(
        name: '4K Ultra HD Smart TV - Best Smart Television for Home Entertainment',
        description: [
            'Immerse yourself in breathtaking visuals with our 4K Ultra HD Smart TV.',
            'Dolby Atmos sound for a cinematic audio experience.',
            'Smart TV features for seamless streaming of your favorite content.',
            'Elegant design that enhances the aesthetics of your living space.',
            'Versatile connectivity with multiple HDMI and USB ports.',
            'Hands-free operation with advanced voice control.',
            'Environmentally friendly LED technology for energy-efficient viewing.',
            'Smart functionality remote included for convenient use.',
            'Easy setup and user-friendly interface for hassle-free entertainment.'
        ],
        price: 1399.99,
        category: 'Electronics',
        rating: 4
    )
    # Product 2
    Product.create(
        name: 'Ultimate Cookbook Collection - Explore Culinary Delights with Top Recipe Books',
        description: [
            'Unlock your culinary potential with this diverse cookbook collection.',
            'Discover a variety of recipes from different cuisines around the world.',
            'Step-by-step instructions for easy and enjoyable cooking experiences.',
            'Beautifully illustrated with mouth-watering photos to inspire your creations.',
            'Nutritional information included for mindful and healthy cooking.',
            'Valuable tips and tricks shared by renowned chefs in the industry.',
            'Suitable for both beginners and experienced cooks alike.',
            'Hardcover edition for durability and a stylish addition to your bookshelf.',
            'Perfect gift for food enthusiasts and aspiring chefs.'
        ],
        price: 59.99,
        category: 'Books',
        rating: 2
    )
    # Product 3
    Product.create(
        name: 'Premium Wireless Bluetooth Earbuds - Immerse in High-Quality Wireless Sound',
        description: [
            'Experience high-quality sound and wireless freedom with our Bluetooth earbuds.',
            'Extended battery life for prolonged usage without interruptions.',
            'Comfortable fit with advanced noise isolation technology.',
            'Intuitive touch controls for easy and convenient operation.',
            'Water-resistant design for those with an active lifestyle.',
            'Portable charging case for on-the-go convenience and additional battery life.',
            'Bluetooth 5.1 for stable and fast connectivity with your devices.',
            'Built-in microphone for clear and hands-free calls.',
            'Compatible with both iOS and Android devices for versatile use.'
        ],
        price: 89.99,
        category: 'Electronics',
        rating: 3
    )
    # Product 4
    Product.create(
        name: 'Epic Sci-Fi Adventure Novel - Journey into a Futuristic Fictional Universe',
        description: [
            'Embark on an epic sci-fi journey with this thrilling adventure novel.',
            'Explore a futuristic world filled with captivating imagination.',
            'Dynamic characters facing intergalactic challenges and adventures.',
            'Plot twists that will keep you on the edge of your seat throughout.',
            'Delve into advanced technologies and civilizations beyond our imagination.',
            'Themes of resilience and hope in the face of interstellar adversity.',
            'Action-packed scenes with laser-sharp focus and intensity.',
            'Intricate details that create a vivid and immersive fictional universe.',
            'A must-read for science fiction enthusiasts and those craving excitement.'
        ],
        price: 29.99,
        category: 'Books',
        rating: 5
    )
    # Product 5
    Product.create(
        name: 'Smart Health Tracker Watch - Stay Connected and Fit with Advanced Smartwatch',
        description: [
            'Stay connected and track your fitness with this advanced smartwatch.',
            'Built-in GPS for accurate location tracking during workouts.',
            'Comprehensive health monitoring features for holistic well-being.',
            'Customizable watch faces to suit your personal style and preferences.',
            'Waterproof design for all-weather wear, rain or shine.',
            'Long-lasting battery life for extended usage between charges.',
            'Compatible with popular fitness apps for comprehensive tracking and analysis.',
            'Receive notifications and calls directly on your wrist for added convenience.',
            'Sleek and modern design that complements any outfit effortlessly.'
        ],
        price: 159.99,
        category: 'Electronics',
        rating: 4
    )
    # Product 6
    Product.create(
        name: 'Artisanal Gourmet Coffee Beans - Indulge in Rich Single-Origin Coffee Flavors',
        description: [
            'Experience the rich flavors of artisanal gourmet coffee with these premium beans.',
            'Single-origin beans carefully selected for a distinct and exquisite taste profile.',
            'Artisanally roasted to perfection for optimal flavor extraction.',
            'Packaged in a resealable bag to maintain the freshness of your coffee.',
            'Sustainably sourced beans for an ethical and responsible coffee consumption.',
            'Delight in notes of chocolate, caramel, and hints of fruit in every sip.',
            'Medium-dark roast for a well-balanced and satisfying cup of coffee.',
            'Suitable for various brewing methods to cater to your coffee preferences.',
            'Perfect for coffee enthusiasts seeking the highest quality and flavor.'
        ],
        price: 24.99,
        category: 'Groceries',
        rating: 4
    )
    # Product 7
    Product.create(
        name: 'Premium Wireless Noise-Canceling Headphones - Immerse in Crystal Clear Audio',
        description: [
            'Immerse yourself in music with these high-quality wireless headphones.',
            'Active noise-canceling technology for a serene and uninterrupted listening experience.',
            'Over-ear design for comfortable and immersive sound quality.',
            'Foldable and portable design for on-the-go convenience and easy storage.',
            'Bluetooth connectivity for seamless pairing with your devices.',
            'Extended battery life for prolonged listening sessions without interruptions.',
            'Touch controls for easy playback and volume adjustments at your fingertips.',
            'Premium materials for durability and comfort during extended wear.',
            'Includes a travel case for protection and portability during transit.'
        ],
        price: 139.99,
        category: 'Electronics',
        rating: 5
    )
    # Product 8
    Product.create(
        name: 'Intriguing Mystery Thriller Book - Unravel the Secrets and Suspense',
        description: [
            'Unravel the secrets and suspense with this gripping mystery thriller novel.',
            'Twists and turns that will keep you guessing until the very end.',
            'Compelling characters with hidden motives waiting to be discovered.',
            'Atmospheric setting that adds to the suspense and intrigue of the storyline.',
            'Investigative plot filled with unexpected revelations and plot twists.',
            'Themes of trust, betrayal, and redemption woven into the captivating narrative.',
            'Well-crafted dialogue that enhances character development and depth.',
            'Satisfying resolution that ties up loose ends for a complete reading experience.',
            'Perfect for fans of thrilling and unpredictable mystery novels.'
        ],
        price: 22.99,
        category: 'Books',
        rating: 4
      # Product 9
    Product.create(
        name: 'Smart Home Robot Vacuum Cleaner - Effortless Cleaning for Modern Living Spaces',
        description: [
            'Experience hands-free cleaning with our Smart Home Robot Vacuum Cleaner.',
            'Advanced sensors for efficient navigation and coverage.',
            'Powerful suction for thorough removal of dust and debris.',
            'Programmable cleaning schedules for convenience.',
            'Quiet operation for minimal disturbance during cleaning.',
            'Smartphone app control for remote monitoring and customization.',
            'Automatic charging and resume functionality for uninterrupted cleaning.',
            'Compact design to reach tight spaces and under furniture.',
            'A must-have for a clean and modern home environment.'
        ],
        price: 249.99,
        category: 'Electronics',
        rating: 4
    )
    # Product 10
    Product.create(
      name: 'Organic Herbal Tea Set - Relax and Unwind with a Variety of Natural Infusions',
      description: [
          'Indulge in the soothing experience of our Organic Herbal Tea Set.',
          'A curated selection of organic herbal teas for relaxation and wellness.',
          'Rich flavors and aromas from natural and premium ingredients.',
          'Caffeine-free blends for a calming and stress-relieving experience.',
          'Includes a variety of herbal infusions with unique health benefits.',
          'Packaged in eco-friendly and biodegradable materials.',
          'Perfect for tea enthusiasts and those seeking a mindful tea-drinking ritual.',
          'Discover new flavors and embrace the tranquility of herbal tea.',
          'A thoughtful gift for tea lovers and self-care enthusiasts.'
      ],
      price: 19.99,
      category: 'Groceries',
      rating: 5
    )
)
    puts "Done!"
end