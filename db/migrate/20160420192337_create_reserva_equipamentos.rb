class CreateReservaEquipamentos < ActiveRecord::Migration
  def change
    create_table :reserva_equipamentos do |t|
      t.integer :equipamento_id
      t.integer :user_id
      t.datetime :data_ini_equip
      t.datetime :data_fin_equip

      t.timestamps null: false
    end
  end
end
