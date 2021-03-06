class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
