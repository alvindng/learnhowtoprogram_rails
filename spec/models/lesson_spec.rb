require 'rails_helper'

describe Lesson do
  it { should validate_presence_of :name }
  it { should validate_presence_of :content }
  it { should validate_presence_of :number }
  it { should belong_to :section }

  context '#next' do
    it 'returns the lesson with the next-highest number than the current lesson' do
      course = Course.create(name: "Rails")
      section = Section.create(name: "Week 1", course_id: course.id)
      current_lesson = Lesson.create(name: 'lesson1', content: 'example1', number: 1, section_id: section.id)
      next_lesson = Lesson.create(name: 'lesson2', content: 'example2' ,number: 2, section_id: section.id)
      expect(current_lesson.next).to eq next_lesson
    end
    it 'returns an error if there is no upcoming lesson.' do
      course = Course.create(name: "Rails")
      section = Section.create(name: "Week 1", course_id: course.id)
      current_lesson = Lesson.create(name: 'lesson1', content: 'example1', number: 1, section_id: section.id)
      expect(current_lesson.next).to eq current_lesson
    end
  end

  context '#previous' do
    it 'returns the lesson with the next number lower than the current lesson' do
      course = Course.create(name: "Rails")
      section = Section.create(name: "Week 1", course_id: course.id)
      current_lesson = Lesson.create(name: 'lesson2', content: 'example2' ,number: 2, section_id: section.id)
      previous_lesson = Lesson.create(name: 'lesson1', content: 'example1', number: 1, section_id: section.id)
      expect(current_lesson.previous).to eq previous_lesson
    end
    it 'returns an error if there is no previous lesson.' do
      course = Course.create(name: "Rails")
      section = Section.create(name: "Week 1", course_id: course.id)
      current_lesson = Lesson.create(name: 'lesson2', content: 'example2' ,number: 2, section_id: section.id)
      expect(current_lesson.previous).to eq current_lesson
    end
  end
end
