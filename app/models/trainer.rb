class Trainer < ApplicationRecord
  validates :title, length: { maximum: 180 }
  mount_uploader :image, ImageUploader

  has_many :trainer_categories
  has_many :categories, through: :trainer_categories, dependent: :destroy
  accepts_nested_attributes_for :trainer_categories, allow_destroy: true

  has_many :gym_trainers
  has_many :gyms, through: :gym_trainers, dependent: :destroy
  accepts_nested_attributes_for :gym_trainers, allow_destroy: true

  has_many :trainer_districts
  has_many :districts, through: :trainer_districts, dependent: :destroy
  accepts_nested_attributes_for :trainer_districts, allow_destroy: true

  has_many :comments, dependent: :destroy

  has_many :likes
  has_many :liked_users, through: :likes, source: :user, dependent: :destroy
  enum sex: { 男性: 0, 女性: 1}
  def self.sort(selection)
    case selection
    when 'new'
      return all.order(created_at: :DESC)
    when 'old'
      return all.order(created_at: :ASC)
    end
  end

  ransacker :comment_count do
    query = '(SELECT COUNT(comments.trainer_id) FROM comments where comments.trainer_id = trainers.id GROUP BY comments.trainer_id)'
    Arel.sql(query)
  end

  ransacker :likes_count do
    query = '(SELECT COUNT(likes.trainer_id) FROM likes where likes.trainer_id = trainers.id GROUP BY likes.trainer_id)'
    Arel.sql(query)
  end

end