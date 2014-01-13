class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  def self.sorted_user
    order('name ASC')
  end
end
