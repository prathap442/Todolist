class CreateTodoitems < ActiveRecord::Migration[5.1]
  def change
    create_table :todoitems do |t|
      t.string :content
      t.references :todolist, foreign_key: true

      t.timestamps
    end
  end
end
