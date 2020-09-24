class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :preparation_day

  # 選択が「---」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :condition_id
  validates :postage_id
  validates :shipping_area_id
  validates :preparation_day_id
  end

  belongs_to :user, foreign_key: 'user_id', optional: true
  # has_many :comments, dependent: :destroy
  has_one :product_purchase
  has_one_attached :image
  with_options presence: true do
  validates :name, length: {maximum: 40}
  validates :price, numericality: { with:/\A[0-9]+\z/, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :introduction, presence: true, length: {maximum: 1000}
  end
end