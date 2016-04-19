class User < ActiveRecord::Base
  validates :nome,  
  presence: true, 
  length: { maximum: 255 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
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
  uniqueness: true
end
