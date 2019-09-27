class CreateTeachents < ActiveRecord::Migration
  def change
    create_table :teachents do |t|
      t.integer :user_id
      t.string :course
      t.string :subject
      # t.string :source
      # t.datetime :started
      # t.datetime :completed
      # t.boolean :certificate

      t.timestamps null: false
    end
  end
end
