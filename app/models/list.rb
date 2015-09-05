class List < ActiveRecord::Base
  acts_as_list

  has_many :todos, -> { order(position: :asc) }, dependent: :destroy
  belongs_to :user
end
