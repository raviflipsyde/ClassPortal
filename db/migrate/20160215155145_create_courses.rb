class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :number
      t.string :title
      t.string :description
      t.date :startdate
      t.date :enddate
      t.boolean :status

      t.timestamps null: false
    end
  end
end
