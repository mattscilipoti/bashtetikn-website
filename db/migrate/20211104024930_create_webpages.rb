class CreateWebpages < ActiveRecord::Migration[6.1]
  def change
    create_table :webpages do |t|
      t.string :name
      t.string :url, null: false

      t.timestamps
    end
  end
end
