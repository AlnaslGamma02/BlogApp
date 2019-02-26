class AddIndexToUser < ActiveRecord::Migration[5.1]
  def change
    # 一意性制約つきのインデックス追加
    add_index :users, :name, :unique => true
  end
end
