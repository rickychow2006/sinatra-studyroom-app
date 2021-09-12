class CreateStudyPosts < ActiveRecord::Migration
  def change
    create_table :study_posts do |t|
      t.string :u_name
      t.string :date 
      t.string :description
      t.string :study_time
      t.timestamps null: false
    end
  end
end
