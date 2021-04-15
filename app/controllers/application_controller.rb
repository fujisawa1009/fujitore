class ApplicationController < ActionController::Base
    # protect_from_forgery with: :null_session
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_search
    after_action :store_location

    TRA_PAGE = 12
    GYM_PAGE = 7


    def store_location
        if (request.fullpath != "/users/sign_in" && \
            request.fullpath != "/users/sign_up" && \
            request.fullpath != "/users/password" && \
            !request.xhr?)
          session[:previous_url] = request.fullpath 
        end
    end

    def after_sign_in_path_for(resource)
      case resource
      when User
        session[:previous_url] || root_path
      when Admin
        admin_root_path
      end
    end

    def new
      @contact = Contact.new
    end

    def set_search
      @q = Gym.ransack(params[:q])
    end
    
    private

    def sign_in_required
      redirect_to new_user_session_url unless user_signed_in?
    end

    protected
        def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :image_name, :sex])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :age, :image_name, :sex])
    end
    
end
