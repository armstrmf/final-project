class GolferSessionsController < ApplicationController
  # skip_before_action(:force_golfer_sign_in, { :only => [:new_session_form, :create_cookie] })

  def new_session_form
    render({ :template => "golfer_sessions/sign_in.html.erb" })
  end

  def create_cookie
    golfer = Golfer.where({ :email => params.fetch("query_email") }).at(0)
    
    the_supplied_password = params.fetch("query_password")
    
    if golfer != nil
      are_they_legit = golfer.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/golfer_sign_in", { :alert => "Incorrect password." })
      else
        session.store(:golfer_id, golfer.id)
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/golfer_sign_in", { :alert => "No golfer with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end
 
end
