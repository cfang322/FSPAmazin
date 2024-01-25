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
    # Product 1 - Home
    home1 = Product.create(
        name: 'Bounty Quick Size Paper Towels, White, 8 Family Rolls = 20 Regular Rolls',
        description: [
            'Pack contains 8 Family Rolls of Bounty white Quick Size Paper Towels',
            'Our shortest sheets are now more even more absorbent for a versatile clean',
            'More absorbent so you can use less* *vs. leading ordinary brand',
            'Picks up messes quicker* *vs. leading ordinary brand.',
            'With Quick Size rolls you can choose your sheet size based on the size of your mess.',
            '4 packs of 2 Family Rolls = 20 Regular Rolls.',
            'Most Awarded Paper Towel* *based on online media awards for the past 6 years.',
            'Now more clothlike* *vs. previous product.',
            'Why use more when you can use less* *vs. leading ordinary brand.'
        ],
        price: 23.20,
        category: 'Home',
        rating: 4
    )
    home1.photo.attach(io: URI.open('https://amazin-seeds.s3.amazonaws.com/products-seeds-images/bounty-paper-towel.jpg'), filename: 'bounty-paper-towel.jpg')
    
    # Product 2 - Home
    home2 = Product.create(
        name: '4 Pack Candles for Home Scented, Lavender Scented Candles 28 Oz Sage Candles for Cleansing House Negative Energy 200 Hour Long Lasting Aromatherapy Candles Gifts for Women Christmas Birthday',
        description: [
            '【 2 Pleasant Scent Lavender Candles & Sage Candle】2Pack Lavender Candles can be used for stress relief, improving sleep. 2Pack Sage Candles for cleansing house negative energy and cleansing air in the room. These scented candles create a natural harmony for home and body. Pleasant aromatherapy jar candles surround you with strong fragrance and soft glow, smell like a fresh bouquet.',
            '【100% Natural Soy Wax Candles】The relaxing aromatherapy candle is made of naturally cultivated sage, lavender and 100% natural soy wax, wick is made of Lead free cotton, perfect for the bathroom, bedroom, kitchen, living room, office, etc. Burns clean and smokless which is friendly to children and pets., fresh the air and relax your mood.',
            '【200 Hours Long-Lasting Burning】50 hours burning time each candle, 4 Pack candles will burn about 200 hours. This can be used for family and friends party, perfect for home, dinner, relax, SPA, Yoga, bath, sleep, family party, insomnia, meditation, aromatherapy or office use. 【NOTE】Remove The Wax Paper Before Use. The Deeper The Cup Is Used, The More Attention You Need to Trim The Candle Wick Later.',
            '【Natural Candles Fragrance】Pure natural essential oils scented candles which has a better diffusion ability. Soothing lavender aromatherapy candles can quickly fill your home with a relaxing and soothing aroma, which is great for sleep-promoting and relief from stress, depression, and anxiety. Place sage candles in your home and workspaces to make way for positive, creative productivity.',
            '【Perfect Gifts Idear for Women】These aromatherapy jar candles with pretty giftable box, make a best gift ideas for 30th, 40th, 60th, 70th, 80th, 21st, 50th Birthday gifts for women, outdoor Halloween decoration indoor party, Wedding gifts, Christmas gifts, bridal shower gift, baby shower party gifts, bridesmaid gifts, Valentines Day, housewarming gifts, Thanksgiving gifts, Anniversary gifts, party favor gifts, thank you gifts, Mothers Day gifts, Graduations gifts.'
        ],
        price: 22.49,
        category: 'Home',
        rating: 5
    )
    home2.photo.attach(io: URI.open('https://amazin-seeds.s3.amazonaws.com/products-seeds-images/candles.jpg'), filename: 'candles.jpg')
    
    # Product 3 - Home
    home3 = Product.create(
        name: 'BLUEAIR Air Purifier Large Room, Air Cleaner for Dust Pet Dander Smoke Mold Pollen Bacteria Virus Allergen, Odor Removal, for Home Bedroom Living Room, Washable Pre Filter, HEPASilent, Blue 211+ Auto',
        description: [
            'AUTO ADJUSTS SO YOU CAN REST EASY: One touch auto mode uses a particle sensor to monitor pollutant levels and adjusts fan to ensure optimal air quality; LED indicator displays air quality status as excellent (blue), moderate (orange) or polluted (red)',
            'CLEAN AIR IN MINUTES: Blueair’s HEPASilent dual filtration delivers up to 45% faster cleaning and up to 67% less noise than traditional HEPA filtration alone; Quickly cleans 550sqft large room in about 12.5 min or up to 2640sqft XL space in 60min, on high',
            'RATED BEST FOR LOWEST ANNUAL ENERGY CONSUMPTION: Quieter (23 dB) than whisper on low; ENERGY STAR rated - uses less energy (4W) than an LED lightbulb on low so it’s kind to your wallet and the planet',
            'REMOVES 99.99% OF COMMON ALLERGENS: Helps reduce allergens and pollutants that trigger allergy and asthma symptoms',
            'REMOVES ODOR & PARTICLES DOWN TO 0.1 MICRON: Ideal for smoke & smog during wildfire season; Removes 99.97% of airborne particles like smoke, dust, viruses and pet dander, while the carbon filter traps light household odors from smoking, pets and cooking',
            'MOST AWARDED AIR PURIFIER BRAND IN THE US: Blue Pure 211 plus Auto has won Good Housekeeping – 10 Best Air Purifiers of 2021, Best Overall Air Purifier',
            'INDEPENDENTLY TESTED FOR PERFORMANCE & SAFETY, ZERO OZONE: AHAM Verifide for CADR; Ozone Safety Standards Certified by CARB; Zero Ozone Verified (<5 ppb) by Intertek Sustainability Program; Trusted Education Partner of British Health Professional Academy',
            'GENUINE FILTERS FOR OPTIMAL PERFORMANCE: Replace your filter every 6 months to ensure proper functionality & only use genuine Blueair filters; Shop 211 plus Auto replacement filter: B08WWS6XSG; Upgrade to SmokeBlock filter for enhanced removal: B0B453ZDZ6'
        ],
        price: 254.99,
        category: 'Home',
        rating: 4
    )
    home3.photo.attach(io: URI.open('https://amazin-seeds.s3.amazonaws.com/products-seeds-images/air-purifier.jpg'), filename: 'air-purifier.jpg')

    # Product 4 - Home
    home4 = Product.create(
        name: 'LOCHAS Ultra Soft Indoor Modern Area Rugs Fluffy Living Room Carpets for Children Bedroom Home Decor Nursery Rug 4x5.3 Feet, Gray',
        description: [
            'The grey fluffy rug carpet size about 4x5.3 feet / 48x64 inches; There are 10 sizes with 22 colors to choose so that you are able to find the fluffy rug carpet that can match all kinds of rooms here easily',
            'Softness that Relaxes: Our shaggy rug is now softer and warmer than ever as it has1.77'' fluffy plush and premium memory foam interlayer that can pamper your feet with incredible soft touch. Kids would love to play on this warm, furry bedroom rug, offering a cozy place for the familes to relax',
            'Superior Quality Area Rug: Are you still worried about the fluff falling on the floor? The fluffy grey area rug using improved weaving technology, the fluff will keep shaggy long time and not shed; Also thousands of tiny, non slip dots will keep the bedroom rugs stay in place',
            'Perfect Fit for Any Room: The grey living room rug adopts modern minimalism, its solid color goes perfectly with any themed room. Perfect for living room, bedroom, nursery, kid’s playroom, den or home office, thanks to the comfort and warmth the fluffy rug brings to a big family.',
            'Easy to Clean: Simply vacuum with a low-power one, or spot clean and air dry. Do not bleach. Note: Vacuum packed, please lay flat and the memory foam of the large rug will fluff up back in 2-3 days.',
            'Low Maintenance: Simply vacuum with the low-power one as needed, or wipe with the damp cloth to get rid of the stains'
        ],
        price: 21.99,
        category: 'Home',
        rating: 3
    )
    home4.photo.attach(io: URI.open('https://amazin-seeds.s3.amazonaws.com/products-seeds-images/rug.jpg'), filename: 'rug.jpg')

    # Product 5 - Home
    home5 = Product.create(
        name: 'Smeg BLF01CRUS 50s Style Blender,, Cream, 48 Ounces',
        description: [
            'Die cast aluminum powder coated body and backlit chrome knob',
            '3 Preset programs: Smoothie, ice crush and pulse',
            '1,5 Lt/ 48 Oz/ 6 Cups Tritan BPA-Free Jug'
        ],
        price: 289.95,
        category: 'Home',
        rating: 4
    )
    home5.photo.attach(io: URI.open('https://amazin-seeds.s3.amazonaws.com/products-seeds-images/blender.jpg'), filename: 'blender.jpg')

    # Product 6 - Home
    home6 = Product.create(
        name: 'Our Place 10.5-Inch Ceramic Nonstick Skillet Pan, Toxin-Free with Stainless Steel Handle, Oven Safe - Blue Salt',
        description: [
            'ALL-IN-ONE COOKING POWER: With over 45 patents promising quality and ingenuity, the Always Pan 2.0 replaces ten traditional cookware pieces, from frying pans to saucepots, making it the ultimate multitasker in the kitchen.',
            'HEALTH-CONSCIOUS, TOXIN-FREE COOKING: The Always Pan 2.0 is crafted without PTFEs, PFOAs, other PFAS, as well as other potentially toxic materials like lead and cadmium, ensuring safer and healthier meals for you and your family.',
            'SUPERIOR NONSTICK PERFORMANCE: Experience the benefits of Thermakind, our more advanced ceramic coating that is 50% longer lasting, providing effortless food release and easy cleanup.',
            'VERSATILITY AT ITS FINEST: This 10.5-inch pan excels at braising, searing, steaming, sautéing, frying, boiling, baking, serving, and storing, truly accommodating all your culinary needs.',
            'QUALITY AND DURABILITY: Built with premium stainless-steel handle and aluminum body, the Always Pan 2.0 is compatible with all stovetops, including induction. It also features a sturdy lid, making it a reliable and long-lasting addition to your kitchen.'
        ],
        price: 150.00,
        category: 'Home',
        rating: 5
    )
    home6.photo.attach(io: URI.open('https://amazin-seeds.s3.amazonaws.com/products-seeds-images/ceramic-pan.jpg'), filename: 'ceramic-pan.jpg')

    # Product 7 - Home
    home7 = Product.create(
        name: '6 Tier Narrow Shoe Rack, Small Stackable Shoe Stand, Space Saving Furniture Shoe Storage Organizer for Entryway, Closet, Vertical Shoe Tower Rack',
        description: [
            '[Space Saving Shoe Organizer] Overall size: (Length * Width * Height) 10.2 * 9.5 * 32 inches. It is an ideal storage solution for closets, entryways, garages and other storage areas that can keep shoes or accessories in order',
            '[DIY and Stackable] There is no limit to the height and width of our shoe organizer, so you can customize how they are assembled and positioned to suit the space in your home. Stable and resistant to tipping, reusable',
            '[Premium Material] The narrow shoe rack is made of high quality PP plastic, which has a high weight-bearing capacity, stable and durable. The bottom of shoe shelf is cocked to prevent slipping, saving your time to sort out the falling shoes repeatedly. Say goodbye to flimsy shoe racks made of non-woven fabric that fall apart over time. Simply rinse with water to restore its luster',
            '[Easy Installation] The closet shoe rack is easy to assemble and does not require any tools. The special connector design allows you to assemble this rack freely, and all parts are well connected and more stable. And the shoe rack is so easy to disassemble that you can reuse it',
            '[Service Guarantee] This high quality small shoe rack fits any home style. If you have any questions about this shoe rack, please feel free to contact us. We have a professional team to serve you. And we provide 12 months free return service. Please feel free to buy'
        ],
        price: 139.99,
        category: 'Home',
        rating: 4
    )
    home7.photo.attach(io: URI.open('https://amazin-seeds.s3.amazonaws.com/products-seeds-images/shoe-shelf.jpg'), filename: 'shoe-shelf.jpg')
    
    # Product 8 - Home
    home8 = Product.create(
        name: 'CAPHAUS Artificial Fiddle Leaf Fig Tree, 6/7 Feet in Pot with Dried Moss, for Indoor House Home Office Store, Potted Ficus Lyrata Faux Tree, Fake Plant Modern Decoration Gift for Housewarming',
        description: [
            'Living with green - Overall Product Dimensions: Standing 6 Feet, 72 Inch from a planter (included in height) ; Planter Dimensions: H: 5.9 Inch. W: 5.9 Inch. Professional crafted design to mimic the appearance of a real-life fiddle leaf fig tree, intricate detailing on the leaves, looking close to reality. This tree will let you feel the presence of nature. Living every moment with green.',
            'Durable and adjustable - This artificial tree is made of sturdy and premium material (real touch, waterproof, eco-friendly). The base is made of solid cement which to prevent children, pets knock it down. The tree may need to be re-shaped when removed from box to achieve its intended appearance, feel free to adjust the leaves to the shape you like.',
            'Free maintenance: Does not need sunlight, fertilizing, and watering. Looks full and fresh every day. No need to water it daily or to offer special attention. Tired of dead plants? Try this! Impossible to kill artificial tree. If the tree happens to get a little dusty, simply use damp cloth or duster to wipe clean. Look pleasing to the eye, relieve your fatigue of the day, and give you peace of mind.',
            'Flexible decor - Perfect for any setting throughout the household. Add modern style and a green atmosphere to your living room, office, and shop. Perfect for placing on a balcony, terrace, or living room. Decorating the shop with the stylish tree. Faux moss and plant are individual items that can be assembled with ease!',
            'Gorgeous plant for you - Available in 6 / 7 feet, suitable for every corner and place. Also, please do not hesitate to contact us by sending us a message through your Buyer Center, our customer service is kind and efficient to offer you a best solution for any problem you had. We offer premium products for you while exceeding highest industry standards and offer thoughtful and considerate customer care.'
        ],
        price: 60.50,
        category: 'Home',
        rating: 4
    )
    home8.photo.attach(io: URI.open('https://amazin-seeds.s3.amazonaws.com/products-seeds-images/fake-plant.jpg'), filename: 'fake-plant.jpg')

    # Product 9 - Home
    home9 = Product.create(
        name: 'Hoover ONEPWR Evolve Pet Cordless Small Upright Vacuum Cleaner, Lightweight Stick Vac, For Carpet and Hard Floor, BH53422V, Black',
        description: [
            'CORDLESS: Delivers cord-free convenience with the removable and rechargeable ONEPWR 4.0 Ah MAX battery.Charge Time 3-4 hours. Yes Battery Amp Hours 4.0.',
            'PERFECT FOR PETS: Tackle stubborn pet hair and dirt through out the home',
            'ULTRA LIGHTWEIGHT : Weighs less than 9 lbs when you lift it, feels like 2 lbs when you recline it and start vacuuming.',
            'HOLDS 3X MORE DIRT AND PET HAIR: Larger dirt cup capacity than a stick vacuum for less trips to the trash can.',
            'PERFECT FOR CARPET AND HARDFLOOR: On/Off brushroll helps effortlessly transition from carpets to hard floors with the touch of a button.',
            'INLCUDED: Evolve Pet, ONEPWR 4.0 Ah MAX Battery, Charger'
        ],
        price: 178.99,
        category: 'Home',
        rating: 5
    )
    home9.photo.attach(io: URI.open('https://amazin-seeds.s3.amazonaws.com/products-seeds-images/vacuum.jpg'), filename: 'vacuum.jpg')
    
    # Product 10 - Home
    home10 = Product.create(
        name: 'YCOLL Dusty Pink Pillow Covers 24x24 Set of 2 Velvet Striped Pattern - Soft Throw Pillows for Home Decor, Luxury Decorative Pillow Covers for Couch, Bed,Living Room',
        description: [
            'Luxurious Velvet Material: These throw pillow covers are made of high-quality velvet fabric, providing a touch of luxury and elegance to your home decor. The soft and smooth texture adds comfort and sophistication to your couch, sofa, or bed.',
            'Striped Pattern Design: The dusty pink pillow covers feature a stylish striped pattern, adding a contemporary and chic touch to any room. The versatile design complements various interior styles, from modern to traditional, making it a perfect addition to your home.',
            'Perfect Size and Quantity: Each set includes 2pcs 24x24 pillow cover,providing a coordinated look for your decorative pillows. The ideal size fits most standard pillows, ensuring a snug and comfortable fit. Please note: ONLY PILLOW COVERS(NO INSERT), Please allow 1-2cm deviation because of manual cutting and sewing.',
            'Easy to Use and Maintain: The square pillow covers are equipped with a hidden zipper closure, allowing for easy insertion and removal of pillows. They are also machine washable, making cleaning a breeze. Simply wash on a gentle cycle and tumble dry on low.',
            'Enhance Your Home Decor: These decorative pillowcases instantly elevate the aesthetic of your living space. Whether you place them on your couch, sofa, or bed, they effortlessly enhance the ambiance and style of your home.'
        ],
        price: 24.99,
        category: 'Home',
        rating: 4
    )
    home10.photo.attach(io: URI.open('https://amazin-seeds.s3.amazonaws.com/products-seeds-images/cushions.jpg'), filename: 'cushions.jpg')
    
# --------------- #
    #Product 1 - Beauty
    # beauty1 = Product.create(
    #     name: 'Beauty of Joseon Glow Serum Propolis and Niacinamide. Hydrating Facial Moisturizer for Sensitive Skin, Acne, Uneven Skin Tone. Korean Skincare 30ml, 1 fl.oz',
    #     description: [
    #         'Soothe & Calm: The rich Propolis content gently eases red spots, promoting a balanced, even appearance.',
    #         'Oil Control, Moisture Balance: Niacinamide & 0.5% BHA expertly manage sebum, and high-concentration Propolis Extract minimizes pores, unveiling a luminous, refined complexion.',
    #         'All-Day Hydration: Our unique blend ensures consistent hydration, leaving your skin with a captivating, radiant glow.',
    #         'Honey-like texture: It has viscosity like honey, and leaves a subtle glow of moisture, but is not oily or sticky.',
    #         'Formula for Glowing Skin: Infused with 60% Propolis Extract & 2% Niacinamide, reduces pores & calms the skin, revealing clear skin.',
    #         'For Every Skin Type: Our tailored transformative formula is designed to cater to oily, combination, & sensitive skin alike.'
    #     ],
    #     price: 17.00,
    #     category: 'Beauty',
    #     rating: 4
    # )
    # .photo.attach(io: URI.open(''), filename: '.jpg')

    # #Product 2 - Beauty
    # beauty2 = Product.create(
    #     name: '8 Pieces Triangle Powder Puff Face Soft Triangle Makeup Puff Velour Cosmetic Foundation Blender Sponge Beauty Makeup Tools',
    #     description: [
    #         'Diameter: 2.87inch X 2.7inch 0.6inch thickness.',
    #         'Velour facial powder puff, makeup puff, body puff',
    #         'Professional makeup tool, set of 8',
    #         'For use on face & body, for liquid foundation, immerse the puff in water and squeeze dry before use'
    #     ],
    #     price: 3.99,
    #     category: 'Beauty',
    #     rating: 3
    # )
    # .photo.attach(io: URI.open(''), filename: '.jpg')
    
    # #Product 3 - Beauty
    # beauty3 = Product.create(
    #     name: 'goop Beauty Eye Masks for Puffy Eyes | Under Eye Patches for Dark Circles | VEOCEL Lyocell Masks in Niacinamid Serum | Improves Crows Feet, Fine Lines, & Wrinkles | Paraben & Silicone Free | 30-Pack',
    #     description: [
    #         'Eye Masks for Dark Circles and Puffiness: This daily puffy eyes treatment delivers firming, brightening, moisture-boosting benefits to wake up your eyes—and refresh your whole look.',
    #         'Highly Active Ingredients: The under eye patches are made of sustainably sourced VEOCEL Lyocell fibers, then soaked in a concentrated milky eye serum infused with ingredients like honey locust seed extract, olive leaf stem cells, and niacinamide.',
    #         'Clean Skin Care: This cooling eye mask is formulated without parabens, petroleum, phthalates, SLS, SLES, PEGs, TEA, DEA, silicones, or artificial dyes or fragrances. And our formulas are not tested on animals.',
    #         'How to Use: These under eye mask patches are easy to put on and designed not to slip—leave them on for 10 minutes to visibly improve the look of puffiness, dark circles, crows-feet, lax skin, wrinkles, and more.',
    #         'Clinical Results: After one week of daily use (7 applications): 97% said their eye area appeared more rested, 97% said their eye area felt hydrated, 97% said their eye area looked refreshed, 97% said their eye area felt soothed and depuffed.'
    #     ],
    #     price: 125.00,
    #     category: 'Beauty',
    #     rating: 4
    # )
    # .photo.attach(io: URI.open(''), filename: '.jpg')
    
    # #Product 4 - Beauty
    # beauty4 = Product.create(
    #     name: 'ROLOVE Makeup Mirror with Lights,10"x12" Lighted Vanity Mirror, Dimmable Touch Screen, Cosmetic Makeup Mirrors with Stand, Smart Touch Control, Lighted Up Mirrors for Makeup Desk and Bedroom',
    #     description: [
    #         '【Perfect Size】 Indulge in the luxurious experience of our lighted makeup mirror, meticulously crafted with the ideal size of 10" x 12". Immerse yourself in a world of beauty as this perfectly proportioned mirror unveils a flawless view of your face.',
    #         '【Sturdy Stand and 360°Rotation】 Our light up mirror for desk features a robust U-shaped stand that provides stability and support. It ensures the mirror stays securely in place while you&aposre using it. Additionally, the 360-degree rotation capability allows you to position the mirror at any angle you desire, making it convenient to use from various positions.',
    #         '【Smart Dimming】 Get the perfect lighting for your makeup with our smart dimming feature. Adjust the brightness from dim to bright with just a button. Our LED lights also come with eye protection to keep your eyes safe even with the increased light.',
    #         '【Memorable Gift】 Looking for a thoughtful gift for a makeup lover? Look no further. Our lighted vanity makeup mirror with its compact size, adjustable lighting, sturdy stand, and intelligent dimming function is an excellent choice. It combines practicality and style, making it the ideal gift for birthdays, holidays, or any special occasion.',
    #         '【Premium Service】 We stand behind the quality of our product and offer premium service to our customers. Our lighted mirror has passed all tests, including dropping, impact, and heavy pressure tests. If you encounter any issues with your mirror, don&apost hesitate to contact us, and we&aposll make it right. Trust us to provide the best possible experience with our premium lighted mirror for vanity table.'
    #     ],
    #     price: 22.47,
    #     category: 'Beauty',
    #     rating: 5
    # )
    # .photo.attach(io: URI.open(''), filename: '.jpg')
    
    # #Product 5 - Beauty
    # beauty5 = Product.create(
    #     name: 'DERMALOGY by NEOGENLAB Pore Tight (Zero Peeling Mousse)',
    #     description: [
    #         'Upgraded version of the #1 ranked Pore Tight Peeling Mousse ✔️: Vegan, Clean Beauty, Efficacy & Size upgrade (from 80ml to 100ml)',
    #         '“ALL-IN-ONE Exfoliation”: A unique mousse-type peeling formula that delivers total pore tightening, pore refining, sebum control, exfoliation and cleansing benefits for effective removal of blackheads, whiteheads, dead skin, dirt & impurities on the skin.',
    #         'Convenient pore care & exfoliation: Compared to harsh physical exfoliators or pore strips, this peeling formula is simple, gentle, yet effective in helping to capture impurities, blackheads, makeup residues, and dead skin cells within the pores.',
    #         'Firming. Tightening. Skin Lifting Effect: BEAUACTIVE ingredient helps delivers tightening benefits to sagging skin for overall smoother and firmer-looking skin.',
    #         'Vegan & Dermatologist tested: The Pore Zero Peeling Mousse was certified vegan from the Korea Vegan Certification Center, guaranteeing the product is not using animal-derived materials, is not cross-contaminated, and not tested on animals. It also can be used safely on sensitive and troubled skin.'
    #     ],
    #     price: 29.95,
    #     category: 'Beauty',
    #     rating: 3
    # )
    # .photo.attach(io: URI.open(''), filename: '.jpg')

    # #Product 6- Beauty
    # beauty6 = Product.create(
    #     name: 'LazyGa Jade Eye Mask 2pcs - Facial Cooling Mask with 100% Real Jade for Hot & Cold Therapy to Reduce Wrinkles, Puffiness, Migraines, and Anti-Aging',
    #     description: [
    #         'BENEFIT - Our weighted Jade Eye Mask is made of 100% real jade stone beads, which help to reduce wrinkles, puffiness, irritation, and provide headache and migraine relief.',
    #         'COZINESS - Our Jade Eye Mask is designed for hot and cold therapy to provide natural anti-aging benefits. The cooling sensation helps to soothe tired eyes, while the warmth improves blood circulation to help reduce dark circles and puffiness.',
    #         'ECO-FRIENDLINESS - Our Jade Eye Mask is reusable, eco-friendly, and easy to clean. Simply wipe with a soft cloth after each use.',
    #         'EASY TO CARRY - The compact size and lightweight design make it convenient to use at home or on the go. Take your beauty routine to the next level and relax your eyes anytime, anywhere.',
    #         'RELAXATION - Our Jade Eye Mask is not just for beauty purposes. It can also be used for meditation and relaxation, providing a soothing and cooling sensation to help you relieve stress and tension.'
    #     ],
    #     price: 15.29,
    #     category: 'Beauty',
    #     rating: 4
    # )
    # .photo.attach(io: URI.open(''), filename: '.jpg')

    # #Product 7 - Beauty
    # beauty7 = Product.create(
    #     name: 'PEACE OUT Skincare Puffy Eyes. Biocellulose Under-Eye Patches that Minimize Puffiness, Dark Circles and Tired-Looking Eyes with Caffeine and Niacinamide, 6 pairs',
    #     description: [
    #         'Peace Out Puffy Eyes. 6 pairs of soothing biocellulose under-eye patches that help awaken sleepy-looking eyes for a more fresh, revitalized glow and feel.',
    #         'Revitalize Eyes in 15 Minutes. These hydrating under-eye patches are soaked with caffeine to help reduce the appearance of puffiness in the under-eye area.',
    #         'How To. Remove the top and bottom clear protective liners. After cleansing, place the patches onto the skin and adjust to fit comfortably. Remove after 15 minutes. Do not rinse. Pat excess serum into the skin.',
    #         'Clean, Vegan and Effective Ingredients. Caffeine minimizes the appearance of puffiness. Niacinamide reduces the look of dark circles while hyaluronic acid deeply hydrates and delivers moisture.',
    #         'Make Peace with Your Skin. Peace Out Skincare&aposs mission is to help you bring peace to your skin through effective, clean and fun skincare solutions.'
    #     ],
    #     price: 23.75,
    #     category: 'Beauty',
    #     rating: 5
    # )
    # .photo.attach(io: URI.open(''), filename: '.jpg')

    # #Product 8 - Beauty
    # beauty8 = Product.create(
    #     name: 'BeautyBio GloPRO Tool & 4 MicroTip Attachment Heads (Face, Eye, Lip, Body)',
    #     description: [
    #         'The BeautyBio GloPRO Bundle includes the GloPRO tool and four attachment heads: face, eye, lip and body',
    #         'An at-home beauty facial tool designed for every skin type.',
    #         'PM use after cleansing and prior to applying skincare. Glide over skin for 1 minute, 3 times a week',
    #         'Female-owned, people-minded, BeautyBio strives to empower through skincare because we believe beauty can change the world one confidence boost at time. We source the most potent ingredients and pair them with effective natural extracts to bring you clinically proven tools and topicals that delivers results, backed by science.',
    #         'Meet the at-home micro-exfoliation tool that&aposs getting all the buzz! Think of GloPRO as your skin&aposs bestie that helps to maximize skincare absorption, refine uneven texture, smooth fine lines & wrinkles... in just 60 seconds a day'
    #     ],
    #     price: 314.00,
    #     category: 'Beauty',
    #     rating: 5
    # )
    # .photo.attach(io: URI.open(''), filename: '.jpg')

    # #Product 9 - Beauty
    # beauty9 = Product.create(
    #     name: 'Sulwhasoo Essential Comfort Firming Cream: Moisturize, Soothe, and Visibly Firm
    #     ',
    #     description: [
    #         'A whipped firming cream that improves the look of elasticity for a supple, bouncy complexion. Powered by JISUN Firming Complex™, a potent blend of antioxidant-rich Goji Berries, Black Beans, and Arrowroot.',
    #         'This whipped cream helps hydrate, nourish, and improve the appearance of firmness and elasticity.',
    #         'Warm whipped cream with your fingertips, using continual lifting motions, smooth over the face and neck.',
    #         'The Essential Comfort Firming Cream is a soft cream formulated with Sulwhasoo&aposs JISUN Firming Complex and JAUM Moisturizing Complex to moisturize, strengthen the skin barrier, and visibly improve skin firmness.'
    #     ],
    #     price: 28.00,
    #     category: 'Beauty',
    #     rating: 3
    # )
    # .photo.attach(io: URI.open(''), filename: '.jpg')

    # #Product 10 - Beauty
    # beauty10 = Product.create(
    #     name: 'LAPCOS Aqua Sheet Mask, Hydrating Daily Face Mask with Seawater and Plankton Extract to Nourish Skin, Korean Beauty Favorite, 5-Pack',
    #     description: [
    #         'REVITALIZE & HYDRATE SKIN - Our cupra rayon Aqua sheet mask contains Seawater and Plankton extract to provide much needed hydration and vitality',
    #         'DEEP SEA WATER & PLANKTON EXTRACT - Deep dive into your skin’s greatest potential. Plankton extract, which holds vitamins, amino acids and minerals, supplies skin with deep moisture. The natural powerhouse that is Seawater provides a wave of nourishment, so that rough, tired skin regains health and energy',
    #         'RESTORE HEALTHY SKIN - Whether your complexion is stressed from environmental aggressors or lifestyle factors, the nourishing mask, packed with nutrients, is a sejour for skin',
    #         'K-BEAUTY ESSENTIAL - A cult favorite brand, created with the highest quality ingredients and uncompromizing dedication to innovation in beauty and skincare.',
    #         'HOW TO USE - After cleansing and toning, unfold a single sheet and gently spread over face avoiding the eye and mouth areas. Leave on for 10-20 minutes and remove mask, gently patting remaining serum until it is fully absorbed'
    #     ],
    #     price: 18.00,
    #     category: 'Beauty',
    #     rating: 2
    # )
    # .photo.attach(io: URI.open(''), filename: '.jpg')

    # #Product 1 - Grocery
    # grocery1 = Product.create(
    #     name: 'Simply Orange Juice, 52 fl oz, 100% Juice w/Calcium & Vitamin D, Not from Concentrate',
    #     description: [
    #         'Simply Orange Juice with Calcium, 52 fl oz',
    #         'Fresh taste guaranteed',
    #         'Not from concentrate',
    #         'Non GMO'
    #     ],
    #     price: 4.79,
    #     category: 'Grocery',
    #     rating: 5
    # )
    # .photo.attach(io: URI.open(''), filename: '.jpg')

    # #Product 2 - Grocery
    # grocery2 = Product.create(
    #     name: 'Strawberries, 1 Lb',
    #     description: [
    #         'Wash before consuming',
    #         'Grown in the United States, Chile, or Mexico',
    #         'Delicious on their own as a healthy snack or as part of a recipe',
    #         'Store in the refrigerator for maximum shelf life',
    #         'Prepackaged'
    #     ],
    #     price: 5.49,
    #     category: 'Grocery',
    #     rating: 4
    # )
    # .photo.attach(io: URI.open(''), filename: '.jpg')

    # #Product 3 - Grocery
    # grocery3 = Product.create(
    #     name: 'Fresh Brand Mini Cucumbers, 16 Oz
    #     ',
    #     description: [
    #         '16-ounce package of mini cucumbers',
    #         'Greenhouse-grown mini cucumbers are cool, crisp, and refreshing',
    #         'Perfect for snacking or for a quick addition to an appetizer or salad',
    #         'Our Fresh brand products are all about high-quality food that fits every budget, every day.'
    #     ],
    #     price: 2.99,
    #     category: 'Grocery',
    #     rating: 3
    # )
    # .photo.attach(io: URI.open(''), filename: '.jpg')

    # #Product 4 - Grocery
    # grocery4 = Product.create(
    #     name: '4th & Heart Original Grass-Fed Ghee, 9 Ounce, Keto, Pasture Raised, Lactose and Casein Free, Certified Paleo',
    #     description: [
    #         'WE SOURCE THE BEST: Our lactose-free ghee comes from grass-fed, pasture-raised, antibiotic and hormone free New Zealand cows.',
    #         'USE ANYTIME: Our shelf-stable ghee is spreadable at room temperature. No refrigeration required',
    #         'NO SHORTCUTS: Our ghee is cooked the old-fashioned way, not made with a centrifuge.',
    #         'UPGRADE ANY RECIPE: Replace your current butter, olive oil, coconut oil or other cooking oil 1:1 with ghee.',
    #         'DIET FRIENDLY: Great addition to any diet – Certified Keto, Paleo, Gluten Free, Ayurvedic, Whole 30, and FODMAP friendly.',
    #         'HELPFUL NOTE: Ghee may liquefy during shipping, but will re-solidify within a few hours of refrigeration, or overnight at room temperature.'
    #     ],
    #     price: 13.29,
    #     category: 'Grocery',
    #     rating: 5
    # )
    # .photo.attach(io: URI.open(''), filename: '.jpg')

    # #Product 5 - Grocery
    # grocery5 = Product.create(
    #     name: 'Botticelli Fire Roasted Red Peppers (Pack of 1) - Ready-to-Use Sweet & Tender Red Roasted Peppers in a Jar for Sandwiches, Salad, Pizza & Any Recipes - 24oz',
    #     description: [
    #         'BOTTICELLI FIRE ROASTED SWEET RED PEPPERS. Grown from specially selected seeds and then fire roasted and marinated to create an amazing flavor. They&aposre made in small batches to ensure every jar satisfies your taste buds.',
    #         'NUMEROUS USES. The sweet red peppers can be used in lots of dishes, from toppings on pasta and sandwiches to sautéing alongside steaks and sausages. See where your imagination, and taste buds, takes you.',
    #         'AUTHENTIC TASTE OF ITALY. Premium products at an affordable price so you can create your own culinary masterpiece. Enjoy the rich, lively flavor that Italy is known for in your very own kitchen.',
    #         'ALL YOUR COOKING ESSENTIALS. From pasta and sauces to olive oils and vinegars, Botticelli has everything you need for a delicious Italian meal. Bring your friends, bring your family, and bring Botticelli.',
    #         'FIVE GENERATIONS OF HISTORY. Family owned and operated, Botticelli Foods is made with the heart and wisdom of over five generations.'
    #     ],
    #     price: 4.99,
    #     category: 'Grocery',
    #     rating: 3
    # )
    # .photo.attach(io: URI.open(''), filename: '.jpg')

    # #Product 6 - Grocery
    # grocery6 = Product.create(
    #     name: 'Welch&aposs Fruit Snacks, Mixed Fruit, Great Valentines Day Gifts for Kids, Gluten Free, Bulk Pack, Individual Single Serve Bags, 0.8 oz (Pack of 40)',
    #     description: [
    #         'Includes (40) 0.8 oz single serving bags',
    #         'Delicious fruit snacks where fruit is the 1st Ingredient',
    #         'Excellent source of Vitamins A, C & E',
    #         'Gluten free, fat free & preservative free',
    #         'Perfect tasty snack for school lunches, sporting games, the office and more'
    #     ],
    #     price: 9.49,
    #     category: 'Grocery',
    #     rating: 5
    # )
    # .photo.attach(io: URI.open(''), filename: '.jpg')

    # #Product 7 - Grocery
    # grocery7 = Product.create(
    #     name: 'Nate&aposs 100% Pure, Raw & Unfiltered Honey - Award-Winning Taste, 32oz. Squeeze Bottle',
    #     description: [
    #         'Nate&aposs 100% Pure, Raw & Unfiltered Honey is a sweetener as nature intended, with one ingredient: Honey. All we add is the bottle.',
    #         'PURITY GUARANTEE: Every bottle of Nate&aposs most-trusted honey has a purity guarantee to uphold strict testing standards that provide an unmatched level of care and precision that would make any honeybee proud.',
    #         'BEST TASTE: Our blend of honey varietals is crafted for exceptional taste, earning us an award-winning flavor through ChefsBestTM.',
    #         'RAW & UNFILTERED: Raw & Unfiltered means it is gently warmed for pourability and unfiltered to keep the natural goodness, like pollen, intact.',
    #         'DAILY DRIZZLE: Enjoy Nate&aposs 100% Pure, Raw & Unfiltered Honey on anything needing a little natural sweetness - morning coffee or tea, oatmeal, yogurt - or as a better-for-you sweetener in baked goods.'
    #     ],
    #     price: 16.49,
    #     category: 'Grocery',
    #     rating: 5
    # )
    # .photo.attach(io: URI.open(''), filename: '.jpg')

    # #Product 8 - Grocery
    # grocery8 = Product.create(
    #     name: 'Royal Dansk Danish Cookie Selection, No Preservatives or Coloring Added, 12 Ounce',
    #     description: [
    #         'CRISP, BUTTERY COOKIE CLASSICS: Discover a selection of rich Danish butter cookies inside this 12-ounce tin : all with pure butter cookie taste and some with a flavorful coconut or vanilla twist;
    #         ',
    #         'DECADENT AND DISTINCTLY SHAPED: Our blue tin cookies feature our iconic and classic mix of assorted cookies in five shapes : Pretzel Style, Vanilla Ring, Finnish Style, Country Style, and Coconut;
    #         ',
    #         'MADE TO MELT IN YOUR MOUTH: Carefully crafted Danish cookies from Royal Dansk bring baking excellence to every batch, delivering the perfect balance of buttery crispiness in every indulgent bite;
    #         ',
    #         'WHY DO THEY TASTE SO GOOD: We don&apost compromise on quality and remain true to fine Danish baking tradition, using non GMO ingredients with no artificial ingredients, added preservatives, or colors;',
    #         'LONGSTANDING COOKIE CRAFTSMANSHIP: Our crisp butter cookies have provided moments of enjoyment since 1966; With their one-of-a-kind tastes, they deliver simple and sweet memorable taste experiences'
    #     ],
    #     price: 5.69,
    #     category: 'Grocery',
    #     rating: 5
    # )
    # .photo.attach(io: URI.open(''), filename: '.jpg')

    # #Product 9 - Grocery
    # grocery9 = Product.create(
    #     name: 'Prego Pasta Sauce, Italian Tomato Sauce with Roasted Garlic & Herbs, 24 Ounce Jar',
    #     description: [
    #         'FLAVORFUL TOMATO SAUCE: Made with sweet, vine-ripened tomatoes that are blended with roasted garlic and herbs for a savory taste that is authentically Italian',
    #         'GLUTEN FREE PASTA SAUCE: Made almost entirely of vegetables, this spaghetti sauce is naturally gluten free and low in fat',
    #         'LOADED WITH VEGGIES: With tomatoes as the number one ingredient, it&aposs no wonder each half cup serving delivers 40% of your daily vegetables',
    #         'QUICK & EASY DINNERS: Pour it over pasta, use it as a base for your own recipe, or add it to a family favorite',
    #         'FEED THE WHOLE FAMILY: One jar is 24 ounces, easily enough for a dinner for five (and leftovers!)'
    #     ],
    #     price: 3.69,
    #     category: 'Grocery',
    #     rating: 4
    # )
    # .photo.attach(io: URI.open(''), filename: '.jpg')

    # #Product 10 - Grocery
    # grocery10 = Product.create(
    #     name: 'Dunkin&apos Original Blend Medium Roast Ground Coffee, 30 Ounce',
    #     description: [
    #         'Contains 1 - 30 ounce canister of ground coffee',
    #         'Original Blend is the coffee that made Dunkin famous, featuring a rich, smooth taste unmatched by others',
    #         'Medium roast coffee, specially blended and roasted to deliver the same great taste as the brewed Dunkin coffee available in Dunkin shops',
    #         'Pre-ground, ready to brew at home sweet home',
    #         'Enjoy the great taste of Dunkin at home'
    #     ],
    #     price: 21.49,
    #     category: 'Grocery',
    #     rating: 4
    # )
    # .photo.attach(io: URI.open(''), filename: '.jpg')
