# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
names = ['Juan', 'Pedro', 'Jesus', 'Martin', 'Luis', 'Maria', 'Paco', 'Adan', 'Maria', 'Josefa', 'Ana', 'Sofia', 'Javier', 'Antonio', 'Jose', 'Matias', 'Alberto', 'Eva']
surenames = ['Chavez', 'Gonzalez', 'Martinez', 'Alvarez', 'Garza']
x = 1
names.each do |name|
  Member.create(
    firstName: name,
    lastName: surenames.sample,
    email: "#{name.downcase}@mail.com",
    phoneNumber: "123456789",
    active: true,
    paymentDay: 3,
    nextPaymentDate: Time.now() + x.days)
    x = x + 1
end
