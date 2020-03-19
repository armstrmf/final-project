class ApplicationController < ActionController::Base
  before_action(:load_current_golfer)
  
  before_action(:force_golfer_sign_in)
  
  def load_current_golfer
    the_id = session.fetch(:golfer_id)
    @current_golfer = Golfer.where({ :id => the_id }).at(0)
  end
  
  def force_golfer_sign_in
    if @current_golfer == nil
      redirect_to("/golfer_sign_in", { :alert => "You have to sign in first." })
    end
  end

  def homepage
    render({ :template => "layouts/homepage.html.erb" })
  end

end
