class ApplicationController < ActionController::Base
  protect_from_forgery

#before_filter :set_locale
before_filter :set_locale_from_url

def default_url_options(options={})
  logger.debug "default_url_options is passed options: #{options.inspect}\n"
  { :locale => I18n.locale }
end
 
def set_locale
  I18n.locale = params[:locale] || I18n.default_locale
end

# TODO

    #request.user_preferred_languages
      # => [ 'nl-NL', 'nl-BE', 'nl', 'en-US', 'en' ]
	#available = %w{en en-US nl-BE}
    #request.preferred_language_from(available)
      # => 'nl-BE'

    #request.user_preferred_languages
      ## => [ 'en-GB']
    #available = %w{en-US}
    #request.compatible_language_from(available)
      # => 'en-US'

end
