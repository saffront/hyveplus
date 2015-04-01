def generate_uid 
  ((SecureRandom.random_number)*1234567890 + 1234567890).to_i 
end

@admin = User.create!(email: "admin@admin.com", username: "admin", first_name: "Admin", last_name: "Jr.", password: "password", password_confirmation: "password", role: "admin")
@uid = generate_uid
@admin.authentications.build(provider: "email", uid: "#{@uid}").save!

@image1 = File.join(Rails.root.join('app', 'assets', 'images', 'db_seeds', 'morgan_freeman.jpg'))
@user1 = User.create!(email: "morgan.freeman@hyve.com", username: "morgan-freeman", first_name: "Morgan", last_name: "Freeman", password: "password", password_confirmation: "password", avatar: open("#{@image1}"))
@uid = generate_uid
@user1.authentications.build(provider: "email", uid: "#{@uid}").save!
@user1.hyves.build(name: "m.freeman-laptop", uuid: "hyve-0001", distance: "10").save!
@user1.hyves.build(name: "m.freeman-phone", uuid: "hyve-0002", distance: "5").save!

@image2 = File.join(Rails.root.join('app', 'assets', 'images', 'db_seeds', 'taylor_swift.jpg'))
@user2 = User.create!(email: "taylor.swift@hyve.com", username: "taylor-swift", first_name: "Taylor", last_name: "Swift", password: "password", password_confirmation: "password", avatar: open("#{@image2}"))
@uid = generate_uid
@user2.authentications.build(provider: "email", uid: "#{@uid}").save!
@user2.hyves.build(name: "t.swift-laptop", uuid: "hyve-0201", distance: "10").save!
@user2.hyves.build(name: "t.swift-phone", uuid: "hyve-0626", distance: "5").save!
