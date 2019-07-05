class SignUpsController < ApplicationController
  before_action :configure_permitted_parameters
  def show
    render :show, layout: "second_layout"
  end
end
