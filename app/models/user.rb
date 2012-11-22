class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :username, :uniqueness => true
  attr_accessible :login, :username,:email, :password, :password_confirmation, :remember_me, :avatar,:avatar_cache
  attr_accessor :login
  validates :username, :presence => true,
                      :length => { :minimum => 3 }
  
  before_save :set_default_role
  
  has_many :users_roles
  belongs_to :role
  has_many :comments
  
  mount_uploader :avatar, ImageUploader
   
  private

    def self.guest
        Role.find_by_name(:other).users.build
    end

    
    def self.create
        user = User.new
        user.role_id = Role.find_by_name(:other).id 
        user
    end

   
    def set_default_role
      self.role_id ||= Role.find_by_name(:user).id
    end
end
