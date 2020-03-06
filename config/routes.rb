Rails.application.routes.draw do



  # Routes for the Course resource:

  # CREATE
  post("/insert_course", { :controller => "courses", :action => "create" })
          
  # READ
  get("/courses", { :controller => "courses", :action => "index" })
  
  get("/courses/:path_id", { :controller => "courses", :action => "show" })
  
  # UPDATE
  
  post("/modify_course/:path_id", { :controller => "courses", :action => "update" })
  
  # DELETE
  get("/delete_course/:path_id", { :controller => "courses", :action => "destroy" })

  #------------------------------

  # Routes for the Golfer account:

  # SIGN UP FORM
  get("/golfer_sign_up", { :controller => "golfers", :action => "new_registration_form" })        
  # CREATE RECORD
  post("/insert_golfer", { :controller => "golfers", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_golfer_profile", { :controller => "golfers", :action => "edit_registration_form" })       
  # UPDATE RECORD
  post("/modify_golfer", { :controller => "golfers", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_golfer_account", { :controller => "golfers", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/golfer_sign_in", { :controller => "golfer_sessions", :action => "new_session_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/golfer_verify_credentials", { :controller => "golfer_sessions", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/golfer_sign_out", { :controller => "golfer_sessions", :action => "destroy_cookies" })
             
  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
