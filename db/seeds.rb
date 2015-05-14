# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

new_cohort = Cohort.create(name: 'March 2015')
User.create(name: 'James', cohort_id: new_cohort.id)
User.create(name: 'Milena', cohort_id: new_cohort.id)
User.create(name: 'Caron', cohort_id: new_cohort.id)
User.create(name: 'Sanjay', cohort_id: new_cohort.id)
User.create(name: 'George', cohort_id: new_cohort.id)
User.create(name: 'Sara', cohort_id: new_cohort.id)
User.create(name: 'Rich', cohort_id: new_cohort.id)
User.create(name: 'Tomi', cohort_id: new_cohort.id)
User.create(name: 'Jacob', cohort_id: new_cohort.id)
User.create(name: 'Massud', cohort_id: new_cohort.id)