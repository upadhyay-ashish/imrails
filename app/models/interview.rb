class Interview < ActiveRecord::Base

  has_many :attachments
  validates_length_of :contact_number, :maximum=>10
  # validates_uniqueness_of :email  ,:contact_number ,:message => "Record Already Exists"
  # validates_format_of :email,:with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i
  accepts_nested_attributes_for :attachments
  # validates_presence_of :resource_name ,:contact_number  ,:skills  ,:for_location ,:status,:cv_recieved_on,:recieved_from
  validates_numericality_of :contact_number,:total_experience
  First_Round = ["Not Applicable","Moved To Next Round","Rejected"]
  Second_Round = ["Not Applicable","Moved To Next Round","Rejected"]
  MR_Round = ["Not Applicable","Selected","Rejected","Pending with HR"]
  For_Location = ["Not Applicable","Mumbai","Banglore","Gurgaon"]
  Status = ["Not Applicable","Selected","Rejected","Pending","Internal Evaluation"]

end
