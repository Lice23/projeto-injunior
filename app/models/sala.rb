class Sala < ActiveRecord::Base
    has_many :reserva_sala, dependent: :destroy
    validates :nome,
    presence: true
    
    validates :predio,
    presence: true,
    length: { maximum: 35 }
end
