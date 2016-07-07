class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.text :item
      t.text :description

      t.timestamps
    end

    create_table(:users_items, :id => false) do |t|

      t.references :user
      t.references :item

    end
end
end
