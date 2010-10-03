require 'csv'

namespace :app do
  #http://www.fakenamegenerator.com/
  task :load_employees => :environment do
    CSV.foreach("#{RAILS_ROOT}/lib/tasks/employees.csv", :headers => true) do |row|
      department = Department.find_or_create_by_name(row['department'])
      employee = Employee.find_or_create_by_external_id(row['external_id'])
      if row['reports_to'].blank?
        employee.update_attributes(:first => row['first'], :last => row['last'], :reports_to => 0, :department_id => department.id)
      else
        reports_to = Employee.find_or_create_by_external_id(row['reports_to']) 
        employee.update_attributes(:first => row['first'], :last => row['last'], :reports_to => reports_to.id, :department_id => department.id)
      end
    end
  end

end

