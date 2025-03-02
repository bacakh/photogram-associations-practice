# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  caption        :text
#  comments_count :integer
#  image          :string
#  likes_count    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#

class Photo < ApplicationRecord
  validates(:poster, { :presence => true })

  # Association accessor methods to define:
  
  ## Direct associations

  belongs_to :poster, class_name: "User", foreign_key: :owner_id
  has_many :comments, foreign_key: :photo_id, dependent: :destroy
  has_many :likes, foreign_key: :photo_id, dependent: :destroy

  ## Indirect associations

  has_many :fans, through: :likes, source: :fan
end
