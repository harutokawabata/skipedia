# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# admin = Admin.new(:email => 'yamada-tarou@gmail.com', :password => '123456', :name => 'yamada' )
# admin.save

Admin.create(
   # name: 'yamada',
   # email: 'yamada-tarou@gmail.com',
   # password: '123456',
   
   name: 'skipedia-admin',
   email: 'skipedia@gmail.com',
   password: 'skipedia-ls0125',
)