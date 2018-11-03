class AuthenticateManager
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(manager_id: manager.id) if manager
  end

  private

  attr_accessor :email, :password

  def manager
    manager = Manager.find_by_email(email)
    return manager if manager && manager.authenticate(password)

    errors.add :manager_authentication, 'invalid credentials'
    nil
  end
end
