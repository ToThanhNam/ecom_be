class CreateAdminCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :admin_categories do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
