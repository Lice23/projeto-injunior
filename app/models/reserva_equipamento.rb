class ReservaEquipamento < ActiveRecord::Base
    belongs_to :user
    belongs_to :equipamento
end
