class CreateJoiners < ActiveRecord::Migration[6.1]
  def change
    create_table :joiners do |t|
      t.references :event, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
