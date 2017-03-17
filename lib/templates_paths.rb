# lib/templates_paths.rb
module TemplatesPaths
  extend self

  def templates
    Hash[
      Rails.application.assets.each_logical_path.
      select { |file| file.end_with?('swf', 'html', 'json') }.
      map { |file| [file, ActionController::Base.helpers.asset_path(file)] }
    ]
  end
end
