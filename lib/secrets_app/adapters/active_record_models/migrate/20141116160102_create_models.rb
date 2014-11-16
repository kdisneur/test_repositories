class CreateModels < ActiveRecord::Migration
  def up
    create_table :users do |table|
      table.string :name
      table.timestamps
    end

    create_table :billings do |table|
      table.float      :amount
      table.date       :date
      table.references :user

      table.timestamps
    end

    create_table :projects do |table|
      table.string     :name
      table.references :user

      table.timestamps
    end

    create_table :files do |table|
      table.string     :name
      table.text       :content
      table.references :project

      table.timestamps
    end
  end
end
