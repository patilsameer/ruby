class Course
    def initialize(name, students)
      @name = name
      @students = students
    end
  
    def students
      @students
    end
  
    def students=(s)
      @students = s
    end
  end
  
  c = Course.new("SaaS", ["A", "B"])
  c.students = c.students.concat(["X", "Y"])

  