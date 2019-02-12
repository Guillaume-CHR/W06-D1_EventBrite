class User < ApplicationRecord
	has_many :organized_events, foreign_key: 'admin_id', class_name: "Event"
	has_many :attending_events, foreign_key: 'guest_id', class_name: "Attendance"
	has_many :attendances

  validates :email, :uniqueness => { :case_sensitive => false }
  validates :first_name, :last_name, :username, :description, :encrypted_password, presence: true
	validates :description,	length: { minimum: 3 }

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
