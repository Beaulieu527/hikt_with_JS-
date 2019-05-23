class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable

  has_many :hikes
  has_many :reviews, through: :hikes
  
  def slug
      self.username.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end 

  def self.find_by_slug(slug)
      self.all.find{|object| object.slug == slug}
  end 
end
