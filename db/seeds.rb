def generate_uid 
  ((SecureRandom.random_number)*1234567890 + 1234567890).to_i 
end

@admin = User.create!(email: "jiashern@hyveplus.com", username: "jiashern", first_name: "Jia Shern", last_name: "Tan", password: "jiashern123", password_confirmation: "jiashern123", role: "admin")
@uid = generate_uid
@admin.authentications.build(provider: "email", uid: "#{@uid}").save!

@image1 = File.join(Rails.root.join('app', 'assets', 'images', 'db_seeds', 'morgan_freeman.jpg'))
@image2 = File.join(Rails.root.join('app', 'assets', 'images', 'icons', 'briefcase.png'))
@image3 = File.join(Rails.root.join('app', 'assets', 'images', 'icons', 'wallet.png'))
@user1 = User.create!(email: "morgan.freeman@hyve.com", username: "morgan-freeman", first_name: "Morgan", last_name: "Freeman", password: "password", password_confirmation: "password", avatar: open("#{@image1}"))
@uid = generate_uid
@user1.authentications.build(provider: "email", uid: "#{@uid}").save!
@user1.hyves.build(name: "m.freeman-briefcase", uuid: "hyve-0001", distance: "1", image: open("#{@image2}")).save!
@user1.hyves.build(name: "m.freeman-wallet", uuid: "hyve-0002", distance: "2", image: open("#{@image3}")).save!

@image4 = File.join(Rails.root.join('app', 'assets', 'images', 'db_seeds', 'taylor_swift.jpg'))
@image5 = File.join(Rails.root.join('app', 'assets', 'images', 'icons', 'handbag.png'))
@image6 = File.join(Rails.root.join('app', 'assets', 'images', 'icons', 'phone.png'))
@user2 = User.create!(email: "taylor.swift@hyve.com", username: "taylor-swift", first_name: "Taylor", last_name: "Swift", password: "password", password_confirmation: "password", avatar: open("#{@image4}"))
@uid = generate_uid
@user2.authentications.build(provider: "email", uid: "#{@uid}").save!
@user2.hyves.build(name: "t.swift-handbag", uuid: "hyve-0201", distance: "4", image: open("#{@image5}")).save!
@user2.hyves.build(name: "t.swift-phone", uuid: "hyve-0626", distance: "8", image: open("#{@image6}")).save!
