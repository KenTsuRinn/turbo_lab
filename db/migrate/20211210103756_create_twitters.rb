class CreateTwitters < ActiveRecord::Migration[6.1]
  def change
    create_table :twitters do |t|
      t.text :content
      t.string :user
      t.integer :like
      t.integer :dislike

      t.timestamps
    end
  end
end
