class CreateClassrooms < ActiveRecord::Migration[7.1]
  def change
    create_table :classrooms do |t|
      t.string :course_name
      t.string :semester

      t.timestamps null: false
    end
  end
end
