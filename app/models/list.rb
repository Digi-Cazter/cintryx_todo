class List < ActiveRecord::Base
  acts_as_list

  belongs_to :user
end
