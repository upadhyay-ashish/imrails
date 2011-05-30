# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


User.create(:username=>"tcs",:password=>"tcs_!@#",:role=>"Admin")
User.create(:username=>"tcs_superadmin",:password=>"tcs_!@#",:role=>"SuperAdmin")