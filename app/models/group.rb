class Group < ActiveRecord::Base
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :messages

  validates :name, presence: true
  accepts_nested_attributes_for :users
end
