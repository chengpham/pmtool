class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.timestamps
    end
    create_table :tasks do |t|
      t.string :title
      t.date :due_date
      t.boolean :done, default: false
      t.references :project, null: false, foreign_key: true
      t.timestamps
    end
    create_table :discussions do |t|
      t.string :title
      t.text :description
      t.references :project, null: false, foreign_key: true
      t.timestamps
    end
    create_table :comments do |t|
      t.text :body
      t.references :discussion, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.timestamps
    end
  end
end

=begin
-   `:binary`
-   `:boolean`
-   `:date`
-   `:datetime`
-   `:decimal`
-   `:float`
-   `:integer`
-   `:bigint`
-   `:primary_key`
-   `:references`
-   `:string`
-   `:text`
-   `:time`
-   `:timestamp`
=end
