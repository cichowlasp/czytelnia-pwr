class StaticController < ApplicationController
    def index
        @libraries = Library.all
    end
end
