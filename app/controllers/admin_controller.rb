class AdminController < ApplicationController
  layout "admin"
  # @PreAuthorize("hasRole('ADMIN')") in Java
  before_action :authenticate_admin!

  def index
  end
end
