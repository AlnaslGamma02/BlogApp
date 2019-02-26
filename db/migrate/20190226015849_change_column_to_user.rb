class ChangeColumnToUser < ActiveRecord::Migration[5.1]

  # 変更後：NULL制約あり
  def up
    change_column :users, :name, :string, null: false
  end

  # 変更前：NULL制約なし
  def down
    change_column :users, :name, :string
  end
end
