class CreateValidations < ActiveRecord::Migration[6.1]
  def change
    create_table :validations do |t|
      t.string :type
      t.string :url
      t.belongs_to :webpage, foreign_key: true
      t.string :warnings, array: true, default: []
      t.string :issues, array: true, default: []

      t.timestamps
    end
    add_index :validations, :warnings, using: 'gin'
    add_index :validations, :issues, using: 'gin'
  end
end
