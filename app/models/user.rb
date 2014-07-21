class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :name, :presence => { :message => "can't be blank" }
  validates :address, :presence => { :message => "can't be blank" }

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end