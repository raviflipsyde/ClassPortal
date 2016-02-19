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


  def self.search(query)
    where("Status LIKE ? or number LIKE ? or description LIKE ? ","%#{query}%", "%#{query}%", "%#{query}%")
    #where( "title LIKE :search OR number LIKE :search OR description LIKE :search", search: "%#{search}%")
  end

end

