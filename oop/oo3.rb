class Course
    def initialize(name, students)
      @name = name
      @students = students
    end
  
    def add_student(student)
      @students.push(student)
    end
  end
  
  c = Course.new("SaaS", ["A", "B"])
  c.add_student("X")
  c.add_student("Y")