class AddCoursesAndLessonsToSpina < ActiveRecord::Migration[7.1]
  def up
    res = Spina::Resource.create!(id: 1, name: "courses", label: "Courses")
    courses = Course.all
    courses.each do |course|
      page = Spina::Page.create!(
        title: course.name, 
        slug: course.sku,
        resource_id: 1,
        view_template: "course",
        json_attributes:{
          en_content: [
            {name: "slug", content: course.sku, type: "Spina::Parts::Line"},
            {name: "body", content: course.description, type: "Spina::Parts::Text"},
            {name: "summary", content: course.summary, type: "Spina::Parts::Line"},
          ]
        }
      )
      course.lessons.each do |lesson|
        Spina::Page.create!(
          title: lesson.title, 
          slug: lesson.slug,
          ancestry: page.id,
          resource_id: 1,
          view_template: "lesson",
          json_attributes:{
            en_content: [
              {name: "slug", content: lesson.slug, type: "Spina::Parts::Line"},
              {name: "vimeo", content: lesson.vimeo_id, type: "Spina::Parts::Line"},
              {name: "summary", content: lesson.summary, type: "Spina::Parts::Line"},
              {name: "body", content: lesson.description, type: "Spina::Parts::Text"},
            ]
          }
        )
      end
    end
  end

  def down 
    Spina::Page.where(resource_id: 1).destroy_all
    Spina::Resource.where(id: 1).destroy_all
  end
end
