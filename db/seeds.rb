# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#


# puts "done"
# puts Cocktail.all


# Dose.create(description: "10cl")
# Dose.create(description: "5cl")
# Dose.create(description: "50cl")

require 'open-uri'


# url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"


# serialized_ingredients = File.read(url)

# ingredients = JSON.parse(serialized_ingredients)


# # parsed = ActiveSupport::JSON.decode(json)
# #   parsed['ResultSet']['Result'].each do |result|
# #     ingredient = Ingredient.create!({
# #       name: strIngredient1
# #       })
# #   end

# File.open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list", 'wb') do |file|
#   file.write(JSON.generate(ingredients))
# end


require 'net/http'
require 'json'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
uri = URI(url)
# array = []
response = Net::HTTP.get(uri)
list = JSON.parse(response)

list["drinks"].each do |hashh|

   Ingredient.create!(name: hashh["strIngredient1"])

end


# puts list["drinks"].class
# print list["drinks"]

