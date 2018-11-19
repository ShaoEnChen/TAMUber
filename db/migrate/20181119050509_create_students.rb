class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :studentId
      t.float :startLat
      t.float :startLng
      t.float :endLat
      t.float :endLng
      t.timestamps
    end
  end
end
