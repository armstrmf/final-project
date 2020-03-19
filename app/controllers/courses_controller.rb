class CoursesController < ApplicationController
  def index
    @courses = Course.all.order({ :course_name => :asc })

    render({ :template => "courses/index.html.erb" })
  end

  def list_top_courses
    @courses = Course.all.order({ :course_name => :asc })

    @courses.each do |course|
        course.reccos = course.recommendations.count
        course.save
    end
    @top_courses = Course.all.where.not({ :reccos => 0 }).order({ :reccos => :desc }).limit(5)

    render({ :template => "courses/top_list.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @course = Course.where({:id => the_id }).at(0)

    render({ :template => "courses/show.html.erb" })
  end

  def create
    @course = Course.new
    @course.course_name = params.fetch("query_course_name")
    @course.address = params.fetch("query_address")
    @course.par = params.fetch("query_par")
    @course.yardage = params.fetch("query_yardage")

    if @course.valid?
      @course.save
      redirect_to("/courses", { :notice => "Course created successfully." })
    else
      redirect_to("/courses", { :notice => "Course failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @course = Course.where({ :id => the_id }).at(0)

    @course.course_name = params.fetch("query_course_name")
    @course.address = params.fetch("query_address")
    @course.par = params.fetch("query_par")
    @course.yardage = params.fetch("query_yardage")

    if @course.valid?
      @course.save
      redirect_to("/courses/#{@course.id}", { :notice => "Course updated successfully."} )
    else
      redirect_to("/courses/#{@course.id}", { :alert => "Course failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @course = Course.where({ :id => the_id }).at(0)

    @course.destroy

    redirect_to("/courses", { :notice => "Course deleted successfully."} )
  end
end
