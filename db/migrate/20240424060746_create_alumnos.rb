class CreateAlumnos < ActiveRecord::Migration[7.1]
  def change
    create_table :alumnos do |t|
      t.string :nombre
      t.string :matricula

      t.timestamps
    end
  end
end
