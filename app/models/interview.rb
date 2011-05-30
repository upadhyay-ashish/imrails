class Interview < ActiveRecord::Base
  has_many :attachments
  validates_length_of :phoneNumber, :maximum=>10
  validates_format_of :email,:with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i
  accepts_nested_attributes_for :attachments
  validates_presence_of :name ,:phoneNumber  ,:total_exp ,:ror_exp ,:doi ,:type_location ,:result,:email
  validates_numericality_of :phoneNumber,:total_exp

end
