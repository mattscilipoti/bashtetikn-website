# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'database_cleaner'

unless ENV['FORCE_SEED']==Rails.env || Rails.env.development? || Rails.env.test?
  fail "Safety net: If you really want to seed the '#{Rails.env}' database, use FORCE_SEED=#{Rails.env}"
end

puts "Cleaning db, via truncation..."
do_not_truncate = %w[] # add tables to ignore, e.g. users
DatabaseCleaner.clean_with :truncation, :except => do_not_truncate

Website.create!(
  name: 'TEST SITE',
  url: 'https://example.com'
)

Webpage.create!(
  name: 'TEST VALID PAGE 1',
  url: 'https://w3c-validators.github.io/w3c_validators/valid_html5.html'
)

Webpage.create!(
  name: 'TEST INVALID PAGE 1',
  url: 'https://w3c-validators.github.io/w3c_validators/invalid_html5.html'
)

Validation.create!(
  url: 'https://example.com/1',
  webpage: Webpage.first,
  warnings: [{message: 'WARN 1'}],
  issues: [{message: 'ERR 1'}, {message: 'ERR 2'}]
)
