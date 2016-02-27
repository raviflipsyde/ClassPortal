class Instructor < User
  has_many :teaches, :dependent => :delete_all
  has_many :courses, through: :teaches
end
