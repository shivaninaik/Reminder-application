class User < ActiveRecord::Base
  has_many :alerts, :dependent => :destroy
  validates :name, :presence => true, :uniqueness => true
  
  validates :password, :confirmation => true
  attr_accessor :password_confirmation
  attr_reader :password
  #before_distroy :ensure_not_references_to_alert
  
  validate :password_must_be_present
  
  #def ensure_not_references_to_alert
      #if alert.count.zero?
        #return true
      #else
       # errors[:base] << "Alerts present"
      #end
  #end
  
  
  class << self 
    def authenticate(name, password)
      if user = find_by_name(name) 
        if user.hashed_password == encrypt_password(password, user.salt)
            user
        end 
      end
    end
  
    def encrypt_password(password, salt) 
      Digest::SHA2.hexdigest(password + "wibble" + salt)
    end 
  end
  
  
  def password=(password) 
    @password = password
    
    if password.present? 
      generate_salt 
      self.hashed_password = self.class.encrypt_password(password, salt)
    end
  end
  
  private
  
  def password_must_be_present
    errors.add(:password,"Missing Password") unless hashed_password.present?
  end
  
  def generate_salt 
    self.salt = self.object_id.to_s + rand.to_s
  end
  
end
