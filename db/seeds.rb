# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'faker'

puts "Creating Tasks ...."
200.times do
  log_date  = Faker::Date.between(from: 200.days.ago, to: Date.today)
  status    = [true, false, false].sample
  if status == true 
    update_date = log_date + rand(0..14).days
  else
    update_date = log_date
  end
    
  Task.create!([{
    title: Faker::Company.bs,
    description: Faker::Lorem.paragraph(sentence_count: 4, supplemental: false, random_sentences_to_add: 4),
    completed: status,
    created_at: log_date,
    updated_at: update_date
  }])
  print "."
end