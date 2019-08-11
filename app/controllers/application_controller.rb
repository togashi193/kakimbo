class ApplicationController < ActionController::API
  helper_method :current_user

  attr_reader :current_user

  def authenticate_user!
    raise Exceptions::Unauthorized if request.headers['Authorization'].blank?

    auth_client = Firebase::Auth.new
    decoded = auth_client.verify_id_token(request.headers['Authorization'].split(' ', 2).last)

    @current_user = User.find_or_create_by!(uid: decoded[:uid])

  end

  if Rails.env.production?
    rescue_from Exception do |ex|
      logger.fatal("#{ex.class}: #{ex.message}")
      render_error(Exceptions::InternalServerError.new)
    end
  end

  rescue_from Exceptions::ApplicationError do |ex|
    logger.error("#{ex.class}: #{ex.message}")
    render_error(ex)
  end

  rescue_from ActiveRecord::RecordNotFound do |ex|
    logger.error("#{ex.class}: #{ex.message}")
    render_error(Exceptions::NotFound.new)
  end

  rescue_from ActiveRecord::RecordInvalid do |ex|
    logger.error("#{ex.class}: #{ex.message}")
    render_error(Exceptions::BadRequest.new)
  end

  def render_error(ex)
    error = {
      title: ex.class.name.demodulize,
      message: ex.message
    }
    render json: error, status: ex.status
  end
end
