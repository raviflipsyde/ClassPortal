class Student < User
  has_many :enrollments, :dependent => :delete_all
  has_many :courses, through: :enrollments
end
