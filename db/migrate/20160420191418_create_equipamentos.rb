class CreateEquipamentos < ActiveRecord::Migration
  def change
    create_table :equipamentos do |t|
      t.string :desc
      t.boolean :disp

      t.timestamps null: false
    end
  end
end
