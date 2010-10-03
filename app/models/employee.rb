class Employee < ActiveRecord::Base

  named_scope :roots, :conditions => ["reports_to = ?", 0]
end
