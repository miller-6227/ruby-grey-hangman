class User < ActiveRecord::Base
	before_save {self.name = name.downcase}
	validates :name, presence: true, length: {maximum: 15}, uniqueness: {case_sensitive: false}
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
end
