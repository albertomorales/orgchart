class OrgChart
  
  def initialize(params={})
    @params = params 
  end
  
  def all_departments?
    @params[:department_ids].any? {|e| e.blank?}
  end

  def roots
    all_departments? ? Employee.roots : departments.map {|d| d.root}
  end

  def departments
    all_departments? ? Department.all :  Department.find(@params[:department_ids])    
  end

=begin rdoc
  draw the graphviz org chart
=end
  def create 
    
  end

end
