class User < ActiveRecord::Base
	
	attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create, :length => 8 
  validates_presence_of :email, :email_format => true
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates :phone_number, numericality: { only_integer: true }
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :address
  validate :validate_gmail_method 
  
  def encrypt_password
    
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

    def self.authenticate(email, password)
      user = User.find_by_email(email)
      if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      else
        nil
      end
    end

  private

    def validate_gmail_method
      # one or the other must be provided
     if email.include?('@gmail.com') == true
       self.errors.add(:base, "please do not enter gmail account!" )
     end
   end
   
end