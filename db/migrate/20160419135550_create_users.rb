class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nome
      t.string :email
      t.int :cpf
      t.int :telefone
      t.int :matricula

      t.timestamps null: false
    end
  end
end
