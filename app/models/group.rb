class Group < ActiveRecord::Base
  paginates_per 5
  belongs_to :company
  has_many :users, :dependent => :destroy
  validates :name, presence:{message:'入力してください'}
end
