thiri = User.create(name: "thiri", email: "thiri@example.com",password:"password",role:"admin")
thant = User.create(name: "thant", email: "thant@example.com", password: "password")

thiri_house = House.create(name: "Thiri Gay Har", location: "Yangon",rental_fee: 8000, date_built:'2000-12-12',category:'apartment', user: thiri)
thant_house = House.create(name: "Thant apartment", location: "Mandalay", rental_fee: 3000, user: thant)

reservation1 = Reservation.create(user: thiri, house: thiri_house, city: "Mandalay", reservation_date: "2023-08-04")

