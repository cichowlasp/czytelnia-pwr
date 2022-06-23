class StaticController < ApplicationController
    swagger_controller :static, "Static"
    swagger_api :index do
        summary "Show main page for users"
    end
    def index
        @libraries = Library.all
    end
end
