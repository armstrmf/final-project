class RecommendationsController < ApplicationController
  def index
    @recommendations = Recommendation.all.order({ :created_at => :desc })

    render({ :template => "recommendations/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @recommendation = Recommendation.where({:id => the_id }).at(0)

    render({ :template => "recommendations/show.html.erb" })
  end

  def create
    @recommendation = Recommendation.new
    @recommendation.golfer_id = @current_golfer.id
    @recommendation.course_id = params.fetch("query_course_id")

    if @recommendation.valid?
      @recommendation.save
      redirect_to("/courses/#{@recommendation.course_id}", { :notice => "Recommendation created successfully." })
    else
      redirect_to("/courses", { :alert => "Recommendation failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @recommendation = Recommendation.where({ :id => the_id }).at(0)

    @recommendation.golfer_id = params.fetch("query_golfer_id")
    @recommendation.course_id = params.fetch("query_course_id")

    if @recommendation.valid?
      @recommendation.save
      redirect_to("/recommendations/#{@recommendation.id}", { :notice => "Recommendation updated successfully."} )
    else
      redirect_to("/recommendations/#{@recommendation.id}", { :alert => "Recommendation failed to update successfully." })
    end
  end

  def destroy
    course_id = params.fetch("path_id")
    golfer_id = @current_golfer.id
    @recommendation = Recommendation.where({ :golfer_id => golfer_id, :course_id => course_id }).at(0)

    @recommendation.destroy

    redirect_to("/courses/#{course_id}", { :notice => "Recommendation deleted successfully."} )
  end
end
