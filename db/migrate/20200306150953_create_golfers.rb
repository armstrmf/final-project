class CreateGolfers < ActiveRecord::Migration[6.0]
  def change
    create_table :golfers do |t|
      t.string :email
      t.string :password_digest
      t.string :username
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
