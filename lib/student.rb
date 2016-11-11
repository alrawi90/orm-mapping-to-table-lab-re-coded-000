class Student
  attr_accessor :name, :grade
  attr_reader :id

  def initialize(name, grade)
    @id = nil
    @name = name
    @grade = grade
  end
  def self.create(hash)
    name_=hash[:name]
    grade_=hash[:grade]
    obj=Student.new(name_,grade_)
    obj.save
    obj

  end
  def self.create_table
    sql="create TABLE IF NOT EXISTS students (id INTEGER PRIMARY KEY, name TEXT, grade TEXT)"
  DB[:conn].execute(sql)

  end
  def self.drop_table
    sql="drop TABLE students"
  DB[:conn].execute(sql)

  end
  def save
    sql="insert into students (name,grade) values(?,?)"
    DB[:conn].execute(sql,self.name,self.grade)
    @id=DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]

  end
end
