class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.float :weight
      t.float :height
      t.string :address
      t.text :info

      t.timestamps
    end
  end
end
