class Equipamento < ActiveRecord::Base
    has_many :reserva_equipamento, dependent: :destroy
    validates :disc,
    presence: true,
    length: { maximum: 100 }
end
