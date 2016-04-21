class ReservaSala < ActiveRecord::Base
    attr_accessor :teste
    belongs_to :user
    belongs_to :sala
    
    validate :ini_date_cannot_be_in_the_past
    
    validate :fin_date_cannot_smaller_than_ini
    
    validate :horario_nao_bate
    
    def ini_date_cannot_be_in_the_past
      if data_ini_sala.present? && data_ini_sala < Date.today
        errors.add(:data_ini_sala, "não pode estar no passado.")
      end
    end
    
    def fin_date_cannot_smaller_than_ini
      if data_fin_sala < data_ini_sala
        errors.add(:data_fin_sala, "não pode ser antes do início.")
      end
    end
    
    def horario_nao_bate
      puts(ReservaSala.all)
    end
end
