class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
