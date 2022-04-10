class ApplicationController < ActionController::Base
  include DeviseWhitelistConcern
  include SetSourceConcern
  include CurrentUserConcern
  include DefaultPageContentConcern

  around_action :switch_locale

  def switch_locale(&action)
    I18n.with_locale(params[:locale] || I18n.default_locale, &action)
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
