class AddGerenteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gerente, :boolean, default: false
  end
end
