class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :students, through: :enrollments
  has_many :teaches
  has_many :instructors, through: :teaches
  has_many :cmaterials
end
