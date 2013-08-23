class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  attr_accessible :nombre, :apellid, :email, :password, :biografia
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :my_courses
  has_many :friendships
  has_many :courses, through: :my_courses
  has_many :friends, through: :friendships
  #has_many :followers, class_name: "Friendship", foreign_key: "friend_id"
  #has_many :followers, class_name:'Friendship', foreign_key: 'friend_id'
  def gravatar_url
    stripped_email = email.strip
    downcased_email = stripped_email.downcase
    hash = Digest::MD5.hexdigest(downcased_email)
    "http://gravatar.com/avatar/#{hash}?s=300"
  end
  def friend_and_i_ids
    self.friend_ids.unshift(self.id)
  end
end
