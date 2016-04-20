class CreateSalas < ActiveRecord::Migration
  def change
    create_table :salas do |t|
      t.string :nome
      t.integer :predio
      t.boolean :cont_proj
      t.boolean :disp

      t.timestamps null: false
    end
  end
end
