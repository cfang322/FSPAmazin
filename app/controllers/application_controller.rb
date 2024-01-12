class ApplicationController < ActionController::API
    before_action :snake_case_params

    # below is for testing
    def test
        if params.has_key?(:login)
            login!(User.first)
        elsif params.has_key?(:logout)
            logout!
        end
        
        if current_user
            render json: { user: current_user.slice('id', 'username', 'session_token') }
        else
            render json: ['No current user']
        end
    end

    def current_user
        # user whose `session_token` == token in `session` cookie
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    # def logged_in?
    #     !!current_user 
    # end 
    
    def login!(user)
        # reset `user`'s `session_token` and store in `session` cookie
        session[:session_token] = user.reset_session_token!
    end
    
    def logout!
        # reset the `current_user`'s session cookie, if one exists
        # clear out token from `session` cookie
        current_user.reset_session_token!
        session[:session_token] = nil
        @current_user = nil # so that subsequent calls to `current_user` return nil
        
    end
    
    def require_logged_in
        unless current_user
            render json: { message: 'Unauthorized' }, status: :unauthorized 
        end
        # if !logged_in?
        #     render json: {errors: ['Must be logged in']}, status: :unauthorized
        # end
    end

    private

    def snake_case_params
        params.deep_transform_keys!(&:underscore)
    end
end