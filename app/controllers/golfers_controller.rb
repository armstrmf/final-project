class GolfersController < ApplicationController
  # skip_before_action(:force_golfer_sign_in, { :only => [:new_registration_form, :create] })
  
  def new_registration_form
    render({ :template => "golfer_sessions/sign_up.html.erb" })
  end

  def create
    @golfer = Golfer.new
    @golfer.email = params.fetch("query_email")
    @golfer.password = params.fetch("query_password")
    @golfer.password_confirmation = params.fetch("query_password_confirmation")
    @golfer.username = params.fetch("query_username")
    @golfer.city = params.fetch("query_city")
    @golfer.state = params.fetch("query_state")

    save_status = @golfer.save

    if save_status == true
      session.store(:golfer_id,  @golfer.id)
   
      redirect_to("/", { :notice => "Golfer account created successfully."})
    else
      redirect_to("/golfer_sign_up", { :alert => "Golfer account failed to create successfully."})
    end
  end
    
  def edit_registration_form
    render({ :template => "golfers/edit_profile.html.erb" })
  end

  def update
    @golfer = @current_golfer
    @golfer.email = params.fetch("query_email")
    @golfer.password = params.fetch("query_password")
    @golfer.password_confirmation = params.fetch("query_password_confirmation")
    @golfer.username = params.fetch("query_username")
    @golfer.city = params.fetch("query_city")
    @golfer.state = params.fetch("query_state")
    
    if @golfer.valid?
      @golfer.save

      redirect_to("/", { :notice => "Golfer account updated successfully."})
    else
      render({ :template => "golfers/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_golfer.destroy
    reset_session
    
    redirect_to("/", { :notice => "Golfer account cancelled" })
  end

  def index
    @golfers = Golfer.all.order({ :username => :desc })

    @top_golfers = Golfer.all.order({ :avg_score => :desc}).limit(5)

    render({ :template => "golfers/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @golfer = Golfer.where({:id => the_id }).at(0)

    render({ :template => "golfers/show.html.erb" })
  end
  
end
