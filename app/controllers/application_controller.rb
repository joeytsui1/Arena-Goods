class ApplicationController < ActionController::API
    rescue_from StandardError, with: :unhandled_error
    rescue_from ActionController::InvalidAuthenticityToken,
        with: :invalid_authenticity_token

    include ActionController::RequestForgeryProtection
    # protect_from_forgery with: :null_session

    before_action :snake_case_params, :attach_authenticity_token

    def invalid_authenticity_token
        render json: { message: "Invalid authenticity token" }, status: 422
    end

    def unhandled_error(error)
        if request.accepts.first.html?
            raise error
        else
            @message = "#{error.class} - #{error.message}"
            @stack = Rails::BacktraceCleaner.new.clean(error.backtrace)
            render "api/errors/internal_server_error", status: :internal_server_error

            logger.error "\n#{@message}:\n\t#{@stack.join("\n\t")}\n"
        end
    end

    def test
        if params.has_key?(:login)
            @user = User.first
            login!(@user)
            render json: @user
        elsif params.has_key?(:logout)
            logout!
        end
    end

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
        @current_user
    end

    def login!(user)
        session[:session_token] = user.reset_session_token!
        @current_user = user
    end

def logout!
  current_user.reset_session_token! if current_user
  session[:session_token] = nil
  @current_user = nil
end

    def logged_in?
        !!current_user
    end

    def require_logged_in
        if !logged_in?
            render json: { errors: ["Unauthorized"] }, status: 401
        end
    end

    def require_logged_out
        if logged_in?
            render json: { errors: ["Must be logged out"] }, status: 401
        end
    end

    private

    def snake_case_params
        params.deep_transform_keys!(&:underscore)
    end

    def attach_authenticity_token
        headers["X-CSRF-Token"] = masked_authenticity_token(session)
    end
end
