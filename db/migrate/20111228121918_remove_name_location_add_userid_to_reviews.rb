class RemoveNameLocationAddUseridToReviews < ActiveRecord::Migration
  def change
    change_table :reviews do |t|
      t.integer :user_id
      t.remove :name, :location
    end
  end

end
