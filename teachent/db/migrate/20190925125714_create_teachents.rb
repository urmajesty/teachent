class CreateTeachents < ActiveRecord::Migration
  def change
    create_table :teachents do |t|
      t.string :name
      t.string :subject
      t.string :source
      t.datetime :started
      t.datetime :completed
      t.boolean :certificate

      t.timestamps null: false
    end
  end
end
