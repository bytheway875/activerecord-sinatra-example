class CreateCommentsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |table|
      table.text :content
      
      table.timestamps
    end
  end
end
