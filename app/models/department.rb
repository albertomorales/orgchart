class Department < ActiveRecord::Base
  
  has_many :employees

  named_scope :active, :conditions => ["id > ?",0], :order => 'name'

  validates_presence_of :name
  

=begin rdoc
  for this proof of concept just find the person that reports to someone outside of the department
=end
  def root
    @root ||= begin
      map = {}
      self.employees.each {|e| map[e.reports_to] = e.reports_to}
      map
      self.employees.detect {|e| map[e.id].nil?}
    end
  end

end


