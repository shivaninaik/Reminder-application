class AdminController < ApplicationController
  def index
    @total_reminder=Alert.count
  end

end
