class Api::V1::Managers::AuthenticationController < ApplicationController
  def authenticate
    command = authenticate_manager

    if command.success?
      render(
        json: manager.as_json.merge(auth_token: command.result), status: 200
      )
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  private

  def manager
    @manager ||= Manager.find_by(email: params[:email])
  end

  def authenticate_manager
    AuthenticateManager.call(params[:email], params[:password])
  end
end
