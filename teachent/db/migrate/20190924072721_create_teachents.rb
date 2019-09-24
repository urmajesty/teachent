class CreateTeachents < ActiveRecord::Migration
  def change
    create_table :teachents do |t|
      t.string :course
      t.string :category
      t.datetime :started
      t.datetime :completed
      t.boolean :certificate

      t.timestamps null: false
    end
  end
end
