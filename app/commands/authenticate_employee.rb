class AuthenticateEmployee
  prepend SimpleCommand

  def initialize(username, password)
    @username = username
    @password = password
  end

  def call
    JsonWebToken.encode(employee_id: employee.id) if employee
  end

  private

  attr_accessor :username, :password

  def employee
    employee = Employee.find_by_username(username)
    return employee if employee && employee.authenticate(password)

    errors.add :employee_authentication, 'invalid credentials'
    nil
  end
end
