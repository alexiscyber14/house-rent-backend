grace = User.create(name: "gracehtet", email: "gracehtet@example.com",password:"password",role:"admin")
lin = User.create(name: "lin", email: "lin@example.com", password: "password")

house1 = House.create(name: "House 1", location: "Yangon",rental_fee: 2000, date_built:'2000-12-12',category:'apartment', user: grace)
house2 = House.create(name: "House 2", location: "Mandalay", rental_fee: 3000, user: lin)

reservation1 = Reservation.create(user: grace, house: house1, city: "Yangon", reservation_date: "2021-07-20")

