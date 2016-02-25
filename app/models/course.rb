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

    if /\A\d+\z/.match(search)

      mysearch1 = Course.where("number = ?", search.to_i)
       puts("------------------------------------")
        puts('a number')
        puts(mysearch1)
       puts("------------------------------------")
    end

    mysearch2 = Course.where("title LIKE ? or title LIKE ? or description LIKE ?  ", "%#{search}%","%#{search}%","%#{search}%")
    if mysearch1.nil?
      return mysearch2
    else
      return mysearch1
    end

  end

end

