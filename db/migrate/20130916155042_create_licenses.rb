class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.integer :number
      t.string :state, limit: 2
      t.references :user, index: true

      t.timestamps
    end
  end
end
