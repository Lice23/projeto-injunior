class Sala < ActiveRecord::Base
    has_many :reserva_sala, dependent: :destroy
end
