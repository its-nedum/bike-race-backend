class CreateSlogans < ActiveRecord::Migration[6.0]
  def change
    create_table :slogans do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.text :slogan

      t.timestamps
    end
  end
end
