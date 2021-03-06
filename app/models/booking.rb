class Booking < ApplicationRecord
  validates :checkin_date, :checkout_date, presence: true
  validates :guest_num, presence: true
  validate :no_conflicts
  validate :comfirm_guest_num

  belongs_to :listing 

  belongs_to :guest,
  foreign_key: :guest_id,
  class_name: :User

  def no_conflicts
    day = self.checkin_date

    while(day <= self.checkout_date) 
      if self.listing.booked_dates.include?(day)
        errors[:Request] << 'conflicts with existing bookings'
        return
      end 
      
      day += 1
    end 
  end 

  def comfirm_guest_num
    return if self.guest_num >= 1 && self.guest_num <= self.listing.bed_num * 2
    errors[:Please] << 'choose a valid guest number'
  end 

end
