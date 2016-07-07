class WelcomeController < ApplicationController
  def index
  end
  def alert=(message)
        self[:alert] = message
      end

end
