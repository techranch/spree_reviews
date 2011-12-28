class ChangeValueOfRating < ActiveRecord::Migration
  def change
    change_table :ratings do |t|
      t.change :value, :decimal, :scale => 10, :precision => 2
    end
  end
end
