class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.order_by_newest
    order("created_at DESC")
  end
end
