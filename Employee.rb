class Employee
  attr_reader :boss, :salary
  
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end
  
  def bonus(multiplier)
    @salary * multiplier
  end
  
end


class Manager < Employee
  attr_accessor :employees
  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end
  
  def bonus(multiplier)
  total_sal = 0
  @employees.each {|employee| total_sal += employee.salary}
  total_sal * multiplier
  end
end

#TESTING:
# ned = Manager.new("Ned", "founder", 1_000_000, nil)
# darren = Manager.new("Darren", "TA manager", 78_000, ned)
# shawna = Employee.new("Shawna", "TA", 12_000, darren)
# david = Employee.new('David', "TA", 10_000, darren)
# ned.employees += [darren, shawna, david]
# p x = shawna.salary
# p shawna.bonus(2)
# p ned.employees.first.salary
# p ned.bonus(5) # => 500_000
# p darren.bonus(4) # => 88_000
# p david.bonus(3) # => 30_000