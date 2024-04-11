class AddSpinaNeedful < ActiveRecord::Migration[7.1]
  def up
    #We need an account - this will also create a page for us
    Spina::Account.create!(name: "Railzzz", theme: "default")
    Spina::Navigation.create!(
      name: "mains",
      label: "Main menu"
    )
  end
  def down 
    Spina::Account.destroy_all
    Spina::Navigation.destroy_all
    page = Spina::Page.where(name: "homepage").destroy_all
  end
end
