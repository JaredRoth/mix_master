class Song < ActiveRecord::Base
  default_scope { order(:title) }
  validates :title, presence: true, uniqueness: true

  belongs_to :artist
end
