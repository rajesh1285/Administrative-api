class CreateAdminapis < ActiveRecord::Migration[6.0]
  def change
    create_table :adminapis do |t|
      t.string :username
      t.string :email
      t.string :contact
      t.string :password_digest

      t.timestamps
    end
  end
end
