class User < ApplicationRecord
  #メールアドレス小文字変換
  before_save { self.email.downcase! }
  
  #バリデーション
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  
  #passwordに関するセッティング
  has_secure_password
end
