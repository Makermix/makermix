# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

new_cohort = Cohort.create(name: 'March 2015')
new_cohort.users.new(name: 'James', cohort_id: new_cohort.id, email: "https://avatars3.githubusercontent.com/u/10706356?v=3&s=400").save(validate: false)
new_cohort.users.new(name: 'Milena', cohort_id: new_cohort.id, email: "https://avatars1.githubusercontent.com/u/10586474?v=3&s=400").save(validate: false)
new_cohort.users.new(name: 'Caron', cohort_id: new_cohort.id, email: "https://avatars1.githubusercontent.com/u/6671361?v=3&s=400").save(validate: false)
new_cohort.users.new(name: 'Sanjay', cohort_id: new_cohort.id, email: "https://avatars1.githubusercontent.com/u/4478671?v=3&s=400").save(validate: false)
new_cohort.users.new(name: 'George', cohort_id: new_cohort.id, email: "https://avatars1.githubusercontent.com/u/5724925?v=3&s=400").save(validate: false)
new_cohort.users.new(name: 'Sara', cohort_id: new_cohort.id, email: "https://avatars2.githubusercontent.com/u/7441603?v=3&s=400").save(validate: false)
new_cohort.users.new(name: 'Rich', cohort_id: new_cohort.id, email: "https://avatars1.githubusercontent.com/u/9936028?v=3&s=400").save(validate: false)
new_cohort.users.new(name: 'Tomi', cohort_id: new_cohort.id, email: "https://avatars3.githubusercontent.com/u/6730595?v=3&s=400").save(validate: false)
new_cohort.users.new(name: 'Jacob', cohort_id: new_cohort.id, email: "https://avatars3.githubusercontent.com/u/7001177?v=3&s=400").save(validate: false)
new_cohort.users.new(name: 'Massud', cohort_id: new_cohort.id, email: "https://avatars1.githubusercontent.com/u/10505910?v=3&s=400").save(validate: false)
