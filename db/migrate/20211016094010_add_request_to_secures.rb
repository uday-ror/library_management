class AddRequestToSecures < ActiveRecord::Migration[6.0]
  def change
    add_column :secures, :request, :string
  end
end
