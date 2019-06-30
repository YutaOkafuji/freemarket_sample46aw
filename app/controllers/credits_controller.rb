class CreditsController < ApplicationController
  def index; end

  def new
    render :new, layout: "second_layout"
  end

  def edit;end
end
