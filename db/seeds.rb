# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#Admin.create(name: 'admin',email: 'admin@admin.com', created_at: date('now'), updated_at: date('now'), password: 'admin')
User.create(name: 'admin',email: 'admin@admin.com', type: 'Admin', password: 'admin', password_confirmation: 'admin')