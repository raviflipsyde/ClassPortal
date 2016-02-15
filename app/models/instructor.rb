class Instructor < User
  has_many :teaches
  has_many :courses, through: :teaches
end
