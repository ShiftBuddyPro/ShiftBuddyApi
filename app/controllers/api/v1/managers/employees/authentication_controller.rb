class Api::V1::Managers::Employees::AuthenticationController < ApplicationController
  def authenticate
    command = AuthenticateEmployee.call(params[:username], params[:password])

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
 end
