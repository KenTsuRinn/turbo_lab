class TwittersRemoveContent < ActiveRecord::Migration[6.1]
  def change
    remove_column :twitters, :content
  end
end
