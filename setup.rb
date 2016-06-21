require 'sqlite3'

# If you want to overwrite your database you will need
# to delete it before running this file
$db = SQLite3::Database.new "students.db"

module StudentDB
  def self.setup
    $db.execute(
      <<-SQL
        CREATE TABLE students (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          first_name VARCHAR(64) NOT NULL,
          last_name VARCHAR(64) NOT NULL,
          created_at DATETIME NOT NULL,
          updated_at DATETIME NOT NULL
        );
      SQL
    )
  end

  def self.seed
    # Add a few records to your database when you start
    $db.execute(
      <<-SQL
        INSERT INTO students
          (first_name, last_name, created_at, updated_at)
        VALUES
          ('Brick','Thornton',DATETIME('now'), DATETIME('now'));

        # CREATE TWO MORE STUDENTS WHO ARE AT LEAST AS COOL AS THIS ONE.
        
      SQL
    )
  end
end

class Student
  # WRITE RUBY CODE HERE
  # IT SHOULD CONTAIN METHODS THAT EXECUTE SQL COMMANDS
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def self.add(first_name, last_name, created_at, updated_at)
    $db.execute(
      <<-SQL
      INSERT INTO students
      (first_name, last_name, created_at, updated_at)
      VALUES
      (#{first_name}, #{last_name}, DATETIME('now'), DATETIME('now'));
      SQL
      )
  end

  def self.delete(first_name, last_name, created_at, updated_at)
    $db.execute(
      <<-SQL
      DELETE FROM students
      (first_name, last_name, created_at, updated_at)
      VALUES
      (#{first_name}, #{last_name}, DATETIME('now'), DATETIME('now'))
      SQL
      )
  end

  def show_all_students(first_name, last_name, created_at, updated_at)
    $db.execute(
      <<-SQL
      show_all_students = student.all? {|k,v| = 'v'}
      SQL
      )
  end

  def show_students(first_name)
    $db.execute(
      <<-SQL
      show_students = student.all? {|k,v|, v = 'first_name'}
      SQL
      )
  end

  def show_students(last_name)
    $db.execute(
      <<-SQL
      show_students = studen.all? {|k,v|, v = 'last_name'}
      SQL
      )
   end
   
  
end