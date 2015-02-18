class Video < ActiveRecord::Base
  has_many :tags
  has_many :favorites

  belongs_to :owner, class_name: 'User'
end
