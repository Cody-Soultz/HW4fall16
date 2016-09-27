class User < ActiveRecord::Base
    validates :user_id, uniqueness: true
    
    def self.create_user!(user_params)
        user_params[:session_token] = SecureRandom.base64
        User.create!(user_params)
    end
end
