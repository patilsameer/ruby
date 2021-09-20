class Course
    def initialize(name, students)
      @name = name
      @students = students
    end
  end
  
  saas = Course.new("SaaS 201", [
    Student.new(715, "Raj"),
    Student.new(716, "Sai")
  ])

  class Course
    def initialize(name, students)
      @name = name
      @students = students
    end
  
    # Add more students even after the object is initialized.
    def enroll(new_student)
      @students.push(new_student)
    end
  
    def is_student_enrolled?(roll_no)
      @students.any? {|student| student.roll_no == roll_no }
    end
  
    def get_student(roll_no)
      @students.find {|student| student.roll_no == roll_no }
    end
  end
  
  saas = Course.new("SaaS 201", [
    Student.new(715, "Raj"),
    Student.new(716, "Sai")
  ])
  
  puts saas.is_student_enrolled?(715)   # true
  puts saas.is_student_enrolled?(800)   # false
  saas.enroll(Student.new(800, "Ned"))
  puts saas.is_student_enrolled?(800)   # true
  puts saas.get_student(800).name       # Ned