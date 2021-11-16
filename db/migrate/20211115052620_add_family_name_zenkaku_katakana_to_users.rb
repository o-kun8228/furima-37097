class AddFamilyNameZenkakuKatakanaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :family_name_zenkaku_katakana, :string
  end
end
