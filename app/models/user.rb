class User < ActiveRecord::Base
  attr_accessor :remember_token
  
  has_many :reserva_sala, dependent: :destroy
  has_many :reserva_equipamento, dependent: :destroy
  
  validates :nome,  
  presence: true, 
  length: { maximum: 255 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, 
  presence: true, 
  length: { maximum: 255 }, 
  format: { with: VALID_EMAIL_REGEX }, 
  uniqueness: { case_sensitive: false }
  
  validates :cpf,
  presence: true,
  length: { is: 11 },
  uniqueness: true
  
  validates :telefone,
  presence: true,
  length: { in: 8..30 }
  
  validates :matricula,
  presence: true,
  length: { is: 9 },
  uniqueness: true,
  numericality: { greater_than: 0  }
  
  has_secure_password
  validates :password,
  presence: true, 
  length: { minimum: 6 },
  allow_nil: true
  
   # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
   # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
