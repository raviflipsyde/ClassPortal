class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :students, through: :enrollments
  has_many :teaches
  has_many :instructors, through: :teaches
  has_many :cmaterials

  validates :number, presence: true, length: { maximum: 50 },
            uniqueness: { case_sensitive: false }

  validates :title, presence: true, length: { maximum: 255 },
            uniqueness: { case_sensitive: false }

  validates :description, presence: true


  def self.search(search)
    where("title LIKE ?", "%#{search}%")
    where("number LIKE ?", "%#{search}%")
    
  end

end
