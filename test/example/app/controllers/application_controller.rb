class ApplicationController < ActionController::Base
  protect_from_forgery

  skip_before_action :authenticate, :only => :unauthenticated

  def test
    head :ok
  end

  def unauthenticated
    head :ok
  end
end
