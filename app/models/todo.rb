class Todo < ActiveRecord::Base
  acts_as_list

  belongs_to :list

  scope :completed, -> { where(is_complete: true) }
  scope :not_completed, -> { where(is_complete: false) }
end
