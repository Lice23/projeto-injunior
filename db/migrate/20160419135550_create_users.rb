class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :nome
      t.text :email
      t.text :cpf
      t.text :telefone
      t.text :matricula

      t.timestamps null: false
    end
  end
end
