class Lesson < ActiveRecord::Base
  belongs_to :section

  validates :name, :presence => true
  validates :content, :presence => true
  validates :number, :presence => true

  def next
    current_num = self.number
    new_lesson = Lesson.find_by(number: current_num+1, section_id: self.section_id)
    if new_lesson
      new_lesson
    else
      self
    end
  end

  def previous
    current_num = self.number
    new_lesson = Lesson.find_by(number: current_num-1, section_id: self.section_id)
    if new_lesson
      new_lesson
    else
      self
    end
  end
end
