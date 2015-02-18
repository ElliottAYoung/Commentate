class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string     :video_name
      t.text       :description
      t.integer    :rating
      t.belongs_to :user

      t.timestamps
    end
  end
end
