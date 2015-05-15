# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

new_cohort = Cohort.create(name: 'March 2015')
new_cohort.users.new(name: 'James', cohort_id: new_cohort.id, email: "A").save(validate: false)
new_cohort.users.new(name: 'Milena', cohort_id: new_cohort.id, email: "B").save(validate: false)
new_cohort.users.new(name: 'Caron', cohort_id: new_cohort.id, email: "C").save(validate: false)
new_cohort.users.new(name: 'Sanjay', cohort_id: new_cohort.id, email: "D").save(validate: false)
new_cohort.users.new(name: 'George', cohort_id: new_cohort.id, email: "E").save(validate: false)
new_cohort.users.new(name: 'Sara', cohort_id: new_cohort.id, email: "F").save(validate: false)
new_cohort.users.new(name: 'Rich', cohort_id: new_cohort.id, email: "G").save(validate: false)
new_cohort.users.new(name: 'Tomi', cohort_id: new_cohort.id, email: "H").save(validate: false)
new_cohort.users.new(name: 'Jacob', cohort_id: new_cohort.id, email: "I").save(validate: false)
new_cohort.users.new(name: 'Massud', cohort_id: new_cohort.id, email: "J").save(validate: false)
