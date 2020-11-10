class User < ApplicationRecord
    require 'securerandom'

    before_create :create_api_key
    validates_presence_of :email, :password
    validates_uniqueness_of :email
    has_secure_password
    private
    def create_api_key
        self.api_key = SecureRandom.uuid
    end
end
