class RoundsController < ApplicationController
  def index
    @rounds = Round.all.order({ :date_played => :desc })

    render({ :template => "rounds/index.html.erb" })
  end

  def list_best
    @best_rounds = Round.all.order({ :score => :asc}).limit(10)

    render({ :template => "rounds/best.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @round = Round.where({:id => the_id }).at(0)

    render({ :template => "rounds/show.html.erb" })
  end

  def create
    @round = Round.new
    @round.golfer_id = @current_golfer.id
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

  def submit
    render({ :template => "rounds/new_round_form.html.erb" })
  end
end
