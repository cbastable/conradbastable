class Post < ActiveRecord::Base
  attr_accessible :title, :permalink, :content
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true

  #default_scope order: 'microposts.created_at DESC'
end
