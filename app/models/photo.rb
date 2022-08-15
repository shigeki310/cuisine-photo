class Photo < ApplicationRecord
  belongs_to :user 
  has_one_attached :image
  has_many :comments

  with_options presence: true do
    validates :title, :description, :image 
  end
end
