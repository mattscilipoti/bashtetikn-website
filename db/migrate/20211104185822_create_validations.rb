class CreateValidations < ActiveRecord::Migration[6.1]
  def change
    create_table :validations do |t|
      t.string :type
      t.string :url
      t.belongs_to :webpage, null: false, foreign_key: true
      t.array :warnings
      t.array :errors

      t.timestamps
    end
  end
end
