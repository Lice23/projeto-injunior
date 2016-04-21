class AddFixoToReservaEquipamento < ActiveRecord::Migration
  def change
    add_column :reserva_equipamentos, :fixo, :boolean
  end
end
