class AddPostAddressToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :addresses, :post_address, :string
  end
end
