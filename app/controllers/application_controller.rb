require 'http_accept_language'

class ApplicationController < ActionController::Base
  protect_from_forgery


before_filter :set_locale
before_filter :set_locale_from_url

def default_url_options(options={})
  logger.debug "default_url_options is passed options: #{options.inspect}\n"
  { :locale => I18n.locale }
end
 
  def user_preferred_languages
    @user_preferred_languages ||= env['HTTP_ACCEPT_LANGUAGE'].split(',').collect do |l|
      l += ';q=1.0' unless l =~ /;q=\d+\.\d+$/
      l.split(';q=')
    end.sort do |x,y|
      raise "Not correctly formatted" unless x.first =~ /^[a-z\-]+$/i
      y.last.to_f <=> x.last.to_f
    end.collect do |l|
      l.first.downcase.gsub(/-[a-z]+$/i) { |x| x.upcase }
    end
  rescue # Just rescue anything if the browser messed up badly.
    []
  end

  # Finds the locale specifically requested by the browser.
  #
  # Example:
  #
  #   request.preferred_language_from I18n.available_locales
  #   # => 'nl'
  #
  def preferred_language_from(array)
    (user_preferred_languages & array.collect { |i| i.to_s }).first
  end

  # Returns the first of the user_preferred_languages that is compatible
  # with the available locales. Ignores region.
  #
  # Example:
  #
  #   request.compatible_language_from I18n.available_locales
  #
  def compatible_language_from(array)
    user_preferred_languages.map do |x|
      x = x.to_s.split("-")[0]
      array.find do |y|
        y.to_s.split("-")[0] == x
      end
    end.compact.first
  end


if defined?(ActionController::Request)
  ActionController::Request.send :include, HttpAcceptLanguage
elsif defined?(ActionController::AbstractRequest)
  ActionController::AbstractRequest.send :include, HttpAcceptLanguage
elsif defined?(ActionController::CgiRequest)
  ActionController::CgiRequest.send :include, HttpAcceptLanguage
end


def set_locale

 I18n.locale = I18n.default_locale
  # TODO
  #request.user_preferred_languages
      # => [ 'nl-NL', 'nl-BE', 'nl', 'en-US', 'en' ]
  available = %w{en it}
  # I18n.locale = request.preferred_language_from(available)
      # => 'nl-BE'
  #request.user_preferred_languages
      ## => [ 'en-GB']
    #available = %w{en-US}
  I18n.locale = compatible_language_from(available)
      # => 'en-US'
 if params[:locale] 
  I18n.locale = params[:locale] 
end
end



end
