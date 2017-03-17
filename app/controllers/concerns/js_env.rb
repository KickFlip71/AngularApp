# app/controllers/concerns/js_env.rb
require 'templates_paths'

module JsEnv
  extend ActiveSupport::Concern
  include TemplatesPaths

  included do
    helper_method :js_env
  end

  def js_env
    data = {
      env: Rails.env,
      templates: templates
    }

    <<-EOS.html_safe
      <script type="text/javascript">
        shared = angular.module('AngularApp')
        shared.constant('Rails', #{data.to_json})
      </script>
    EOS
  end
end
