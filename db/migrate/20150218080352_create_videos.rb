class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string     :video_name
      t.string     :video_url
      t.text       :description
      t.integer    :likes
      t.belongs_to :user

      t.timestamps
    end
  end
end
