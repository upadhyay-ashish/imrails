class PopulateDataInInterviews < ActiveRecord::Migration
  def self.up
    800.times do |i|
      Interview.create(:cv_recieved_on =>'200#{i+1}-12-20 00:00:00',:recieved_from=>"Recieved#{i+1}",:resource_name=>"Resource#{i+1}",:skills=>"Skills#{i+1}",:total_experience=>i+1,:contact_number=>i+1000000000,:source=>"Source#{i+4}",:status=>"Status#{i+1}",:remarks=>"Remarks #{i}",:first_round=>"Round1 #{i+10}",:second_round=>"Round2 #{i+10}",:mr_round=>"MR #{i+10}",:email=>"zapper#{i+20}@gmail.com",:date_of_interview=>'300#{i+1}-12-20 00:00:00',:date_of_interview=>'400#{i+1}-12-20 00:00:00'  )
    end
  end
  def self.down
    MmdDeliveryDetail.delete_all
  end
end
