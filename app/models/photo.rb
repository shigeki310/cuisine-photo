class Photo < ApplicationRecord
  belongs_to :user 
  has_one_attached :image

  with_options presence: true do
    validates :title, :description, :image 
  end
end
