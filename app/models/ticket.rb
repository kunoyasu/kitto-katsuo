class Ticket < ApplicationRecord
   belongs_to :user
   has_one_attached :image
   has_many :entries, dependent: :destroy
   extend ActiveHash::Associations::ActiveRecordExtensions
       
   belongs_to_active_hash :category
   
   #空の投稿を保存できないようにする
   with_options presence: true do
    validates :image
    validates :name
    validates :introduction
   end
    
   #ジャンルの選択が「--」の時は保存できないようにする
    validates :category_id , numericality: { other_than: 1 } 
  end