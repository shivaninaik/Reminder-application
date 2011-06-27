class MonitorController < ApplicationController
  def index
    @alerts=Alert.all
  end

end
