require 'open-uri'
require 'faker'
require 'json'
array_ingredients = []
counter_ingredient = 0
puts 'Fetching Ingredient List'
url_list = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
puts 'Processing Ingredients'
response = JSON.parse(url_list)
puts 'creating ingredient list'
response["drinks"].each do |item|
  counter_ingredient += 1
  an_ingredient = Ingredient.new(name: item.values.first)
  an_ingredient.save
  array_ingredients << an_ingredient
  puts "#{counter_ingredient} ingredients saved"
end
puts 'All ingredients saved'
puts '******************'
puts 'creating cocktails'
array_drinks = []

counter_drink = 0
50.times do
  counter_drink += 1
  a_drink = Cocktail.new(
    name:"#{Faker::Food.spice} #{Faker::Hipster.word}  #{Faker::Hipster.word}",
    description: "#{Faker::Dessert.flavor} flavor with a touch of #{Faker::Dessert.topping} at #{Faker::Beer.alcohol}")
  a_drink.save
  array_drinks << a_drink
  puts "#{counter_drink} Cocktails saved"
end


array_doses = []
puts 'all cocktails saved'
puts 'mixing cocktails'
counter_mixing = 0
array_drinks.each do |element|
  counter_dose = 0
  rand(2..6).times do
    counter_dose += 1
    a_dose = Dose.new(description: "#{Faker::Food.measurement}")
    a_dose.ingredient = array_ingredients.sample
    a_dose.cocktail = element
    a_dose.save
    array_doses << a_dose
    puts "#{counter_dose} doses made for for cocktail: #{element.name} \n usign #{a_dose.ingredient.name}"
  end
  counter_mixing += 1
  puts "#{counter_mixing} cocktails mixed"
end


puts 'All done'
puts 'task completed'
puts '************'


