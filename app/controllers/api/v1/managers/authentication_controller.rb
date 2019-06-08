class Api::V1::Managers::AuthenticationController < ApplicationController
  def authenticate
    command = authenticate_manager

    if command.success?
      render(json: serialized_manager(command.result))
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  private

  def manager
    @manager ||= Manager.find_by(email: params[:email])
  end

  def serialized_manager(auth_token)
    options = {}
    options[:meta] = { auth_token: auth_token }
    options[:include] = %i[business]
    ManagerSerializer.new(manager, options).serialized_json
  end

  def authenticate_manager
    AuthenticateManager.call(params[:email], params[:password])
  end
end
