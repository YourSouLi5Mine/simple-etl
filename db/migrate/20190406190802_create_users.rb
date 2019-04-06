class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :curp
      t.string :gender

      t.timestamps
    end
  end
end
