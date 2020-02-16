class Task < ApplicationRecord
  #バリデーション
  validates :content, presence: true, length: { maximum: 255 }
  validates :status, presence: true, length: { maximum: 10 }
  
  #参照
  belongs_to :user
end
