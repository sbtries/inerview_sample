class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :role
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
