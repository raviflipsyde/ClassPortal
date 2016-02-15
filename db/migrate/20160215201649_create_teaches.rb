class CreateTeaches < ActiveRecord::Migration
  def change
    create_table :teaches do |t|
      t.text :request
      t.references :instructor, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
