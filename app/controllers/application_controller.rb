class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
    include SessionsHelper
end