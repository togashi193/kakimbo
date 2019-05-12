class ApplicationController < ActionController::API
  helper_method :current_user, :authenticate_user!

  def authenticate_user!
    raise Exceptions::Unauthorized if request.headers['Authorization'].blank?

    auth_client = Firebase::Auth.new
    decoded = auth_client.verify_id_token(request.headers['Authorization'].split(' ', 2).last)

    @current_user = User.find_by(uid: decoded[:uid])

    if @current_user.blank?
      @current_user = User.sign_in_anonymously(decoded[:decoded_token][:payload])
    end
  end


end
