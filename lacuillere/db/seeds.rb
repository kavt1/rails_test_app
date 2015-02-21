# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Restaurant.destroy_all
restaurants_attributes = [
 {
   name:         "Epicure au Bristol",
   address:      "112 rue du Fg St-Honoré 75008 Paris",
   phone_number: "12342234",
   category:     "chinese"
 },
 {
   name:         "La truffière",
   address:      "4 rue Blainville 75005 Paris",
   phone_number: "5624378",
   category:     "italian"
 },
 {
   name:         "Le pré catelan",
   address:      "route de Suresnes 75016 Paris",
   phone_number: "90242387",
   category:     "french"
 },
 {
   name:         "Restaurant de la vie",
   address:      "route de Lemonnier 75897 Paris",
   phone_number: "876233425",
   category:     "japanese"
 },
 {
   name:         "Bar Bravo!",
   address:      "rue de la rivoli 75111 Paris",
   phone_number: "3423423456",
   category:     "belgian"
 }
]
restaurants_attributes.each { |params| Restaurant.create!(params) }