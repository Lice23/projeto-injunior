class ReservaEquipamento < ActiveRecord::Base
    belongs_to :user
    belongs_to :equipamento
    
    validate :ini_date_cannot_be_in_the_past
    
    validate :fin_date_cannot_smaller_than_ini
    

    def ini_date_cannot_be_in_the_past
      if data_ini_equip.present? && data_ini_equip < Date.today
        errors.add(:data_ini_equip, "não pode estar no passado.")
      end
    end
    
    def fin_date_cannot_smaller_than_ini
      if data_fin_equip < data_ini_equip
        errors.add(:data_fin_equip, "não pode ser antes do início.")
      end
    end
end
