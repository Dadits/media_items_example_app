class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to :media_item
      t.attachment :file
      
      t.timestamps
    end
  end
end
