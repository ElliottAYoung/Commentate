class Video < ActiveRecord::Base
  has_many :tags
  belongs_to :owner, class_name: 'User'
end
