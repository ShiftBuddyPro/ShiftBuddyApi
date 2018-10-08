class ApplicationSerializer
  include FastJsonapi::ObjectSerializer
  include Rails.application.routes.url_helpers
end
