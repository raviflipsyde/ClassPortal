class CreateMessages < ActiveRecord::Migration
  def change

    create_table :messages do |t|
      t.text :msg
      t.integer :to_user
      t.integer :from_user
      t.boolean :readflag
      t.boolean :requestflag

      t.timestamps null: false
    end
  end
end
