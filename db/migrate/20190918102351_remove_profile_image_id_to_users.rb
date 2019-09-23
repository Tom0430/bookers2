class RemoveProfileImageIdToUsers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :profileImage, :string
  	remove_column :users, :profile_image_id, :string
  	add_column :users, :profile_image_id, :text


  end
end
