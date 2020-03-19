Rails.application.routes.draw do

  get("/", { :controller => "application", :action => "homepage" })

  # Routes for the Recommendation resource:

  # CREATE
  post("/insert_recommendation", { :controller => "recommendations", :action => "create" })
          
  # READ
  get("/recommendations", { :controller => "recommendations", :action => "index" })
  
  get("/recommendations/:path_id", { :controller => "recommendations", :action => "show" })
  
  # UPDATE
  
  post("/modify_recommendation/:path_id", { :controller => "recommendations", :action => "update" })
  
  # DELETE
  get("/delete_recommendation/:path_id", { :controller => "recommendations", :action => "destroy" })

  #------------------------------

  # Routes for the Round resource:

  # CREATE
  get("/new_round_form", { :controller => "rounds", :action => "submit" })
  post("/insert_round", { :controller => "rounds", :action => "create" })
          
  # READ
  get("/rounds", { :controller => "rounds", :action => "index" })
  get("/best_rounds", { :controller => "rounds", :action => "list_best" })
  
  get("/rounds/:path_id", { :controller => "rounds", :action => "show" })
  
  # UPDATE
  
  post("/modify_round/:path_id", { :controller => "rounds", :action => "update" })
  
  # DELETE
  get("/delete_round/:path_id", { :controller => "rounds", :action => "destroy" })

  #------------------------------

  # Routes for the Course resource:

  # CREATE
  post("/insert_course", { :controller => "courses", :action => "create" })
          
  # READ
  get("/courses", { :controller => "courses", :action => "index" })

  get("/top_courses", { :controller => "courses", :action => "list_top_courses" })
  
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

  # READ

   get("/golfers", { :controller => "golfers", :action => "index" })
   get("/golfers/:path_id", { :controller => "golfers", :action => "show" })
      
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
