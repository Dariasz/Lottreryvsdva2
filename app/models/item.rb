class Item < ApplicationRecord
  belongs_to :winner, class_name: User
  has_and_belongs_to_many :users, :join_table => :users_items
  paginates_per 6

end
