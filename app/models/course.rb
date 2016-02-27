class Course < ActiveRecord::Base
  has_many :enrollments,  :dependent => :delete_all
  has_many :students, through: :enrollments
  has_many :teaches, :dependent => :delete_all
  has_many :instructors, through: :teaches
  has_many :cmaterials, :dependent => :delete_all

  validates :number, presence: true, length: { maximum: 50 },
            uniqueness: { case_sensitive: false }

  validates :title, presence: true, length: { maximum: 255 },
            uniqueness: { case_sensitive: false }

  validates :description, presence: true


  def self.search(search)

    mysearch3 = Course.where("title = ?", "00000")
    puts mysearch3.size

    if /\A\d+\z/.match(search)

      mysearch1 = Course.where("number = ?", search.to_i)
       puts("------------------------------------")
        puts('a number')
        puts(mysearch1)
       puts("------------------------------------")
    end

    mysearch2 = Course.where("title LIKE ? or title LIKE ? or description LIKE ?  ", "%#{search}%","%#{search}%","%#{search}%")



   teachesSearch = Instructor.where("name like ?", "%#{search}%")
    if( teachesSearch.size > 0)
     teachesSearch.each do |t|
      # puts Teach.includes(:course).where("user_id = ?", t.id).course.title
       mysearch3 =  Course.joins(:teaches).where("teaches.user_id =?", t.id)
       mysearch3.each do |my|
      puts my.title
      end
        # puts (Course.joins(:teaches).where("teaches.user_id =?", t.id))
     end
   end

     if !mysearch1.nil?
       puts "search1 printed"
      return mysearch1
    elsif mysearch2.size > 0

      puts "search2 printed"
      puts mysearch2.size
      return mysearch2
     else
       puts "search3 printed"
       puts mysearch3.size
       return mysearch3
    end

  end

end

