class RoundsController < ApplicationController
  def index
    @rounds = Round.all.order({ :created_at => :desc })

    render({ :template => "rounds/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @round = Round.where({:id => the_id }).at(0)

    render({ :template => "rounds/show.html.erb" })
  end

  def create
    @round = Round.new
    @round.golfer_id = params.fetch("query_golfer_id")
    @round.course_id = params.fetch("query_course_id")
    @round.score = params.fetch("query_score")
    @round.date_played = params.fetch("query_date_played")
    @round.tees = params.fetch("query_tees")

    if @round.valid?
      @round.save
      redirect_to("/rounds", { :notice => "Round created successfully." })
    else
      redirect_to("/rounds", { :notice => "Round failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @round = Round.where({ :id => the_id }).at(0)

    @round.golfer_id = params.fetch("query_golfer_id")
    @round.course_id = params.fetch("query_course_id")
    @round.score = params.fetch("query_score")
    @round.date_played = params.fetch("query_date_played")
    @round.tees = params.fetch("query_tees")

    if @round.valid?
      @round.save
      redirect_to("/rounds/#{@round.id}", { :notice => "Round updated successfully."} )
    else
      redirect_to("/rounds/#{@round.id}", { :alert => "Round failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @round = Round.where({ :id => the_id }).at(0)

    @round.destroy

    redirect_to("/rounds", { :notice => "Round deleted successfully."} )
  end
end
