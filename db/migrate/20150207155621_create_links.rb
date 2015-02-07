class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.belongs_to :media_item
      t.string :url
      t.string :link_type
      
      t.timestamps
    end
  end
end
