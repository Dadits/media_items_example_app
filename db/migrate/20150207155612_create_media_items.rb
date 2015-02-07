class CreateMediaItems < ActiveRecord::Migration
  def change
    create_table :media_items do |t|
      t.belongs_to :user
      t.string :name
      t.string :media_type
      t.boolean :shared, default: false
      
      t.timestamps
    end
    add_index :media_items, :name
  end
end
