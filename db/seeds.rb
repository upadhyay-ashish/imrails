# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


User.create(:username=>"tcs",:password=>"tcs_!@#",:role=>"Admin", :firstname=>"tcs", :lastname=>"TCS",:email=>"tcs@tcs.com",:address=>"Powai",:phone_number=>"999999999")
User.create(:username=>"tcs_superadmin",:password=>"tcs_!@#",:role=>"SuperAdmin", :firstname=>"Super", :lastname=>"Admin",:email=>"superadmin@tcs.com",:address=>"Powai",:phone_number=>"999999999")