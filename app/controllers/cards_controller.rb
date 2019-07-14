class CardsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_user, only: [:show]
  require "payjp"

  def new
    @path = Rails.application.routes.recognize_path(request.referer)
    # binding.pry
    card = Card.where(user_id: current_user.id)
    redirect_to action: 'show' if card.exists?
    render :new, layout: 'second_layout' if @path[:controller] == 'delivery_addresses'
  end

  def show
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: 'new'
    else
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(card.customer_id)
      @customer_card = customer.cards.retrieve(card.card_id)
    end
  end

  def edit; end

  def create
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    if params['payjp-token'].blank?
      redirect_to action: 'new'
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params['payjpToken'],
        metadata: { user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id,
                      customer_id: customer.id,
                      card_id: customer.default_card)
      if @card.save
        redirect_to action: 'show'
      else
        redirect_to action: 'create'
      end
    end
    redirect_to user_members_path
  end

  def delete
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
    redirect_to action: 'new'
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
