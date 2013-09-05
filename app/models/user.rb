class User < ActiveRecord::Base
  attr_reader :password
  has_many :messages
  validates :name, presence: true, inclusion: {in: ["J", "Jn"]}
  has_secure_password
  class << self
    def new_remember_token
      SecureRandom.urlsafe_base64
    end

    def encrypt token
      Digest::SHA1.hexdigest(token.to_s)
    end
  end
end
