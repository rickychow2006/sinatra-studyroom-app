class CreateStudyPosts < ActiveRecord::Migration
  def change
    create_table :study_posts do |t|
      t.string :u_name
      t.integer :user_id
      t.string :date 
      t.string :description
      t.integer :study_time

      t.timestamps null: false
    end
  end
end
