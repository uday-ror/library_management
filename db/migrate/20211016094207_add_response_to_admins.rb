class AddResponseToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :response, :string
  end
end
