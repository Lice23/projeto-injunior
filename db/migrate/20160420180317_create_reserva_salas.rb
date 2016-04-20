class CreateReservaSalas < ActiveRecord::Migration
  def change
    create_table :reserva_salas do |t|
      t.integer :sala_id
      t.integer :user_id
      t.datetime :data_ini_sala
      t.datetime :data_fin_sala

      t.timestamps null: false
    end
  end
end
