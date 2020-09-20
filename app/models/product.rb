class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :preparation_day

  #カテゴリーの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :postage_id, numericality: { other_than: 1 }
  validates :shipping_area_id, numericality: { other_than: 1 }
  validates :preparation_day_id, numericality: { other_than: 1 }

  has_one_attached :image
  validates :name, presence:true, length:{maximum:40}
  validates :introduction, presence:true, length:{maximum:1000}
  validates :price, presence:true, numericality: {greater_than_or_equal_to: 300}
  validates :category_id, presence:true
  validates :condition_id, presence:true
  validates :postage_id, presence:true
  validates :prefecture_code_id, presence:true
  validates :preparation_day_id, presence:true

  validates_associated :item_imges
  validates :item_imges, presence:true

  belongs_to :category
  belongs_to :user, foreign_key: 'user_id',optional:true 
  has_many :item_imges, inverse_of: :item,dependent: :destroy
  has_many :comments, dependent: :destroy
  

  
  end


