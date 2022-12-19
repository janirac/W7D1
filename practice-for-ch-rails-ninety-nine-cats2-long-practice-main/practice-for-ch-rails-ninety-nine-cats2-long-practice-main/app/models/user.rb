class User < ApplicationRecord
    validates :username, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :password, length: { minimum: 6 }, allow_nil: true

    before_validation :ensure_session_token

    attr_reader :password

    def password=(new_pass)
        self.password_digest = BCrypt::Password.create(new_pass)
        @password = new_pass #question?
    end 


end
