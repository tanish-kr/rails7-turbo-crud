class CreateTurboMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :turbo_messages do |t|
      t.string :content

      t.timestamps
    end
  end
end
