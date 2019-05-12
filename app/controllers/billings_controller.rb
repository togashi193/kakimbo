class BillingsController < ApplicationController
  def index
    @billings = Billing.all
  end

  def create
    @billing = Billing.create!(
      user: User.first,
      game: Game.find(params[:game]),
      billing_date: params[:date],
      amount: params[:amount],
      note: params[:note],
    )
  end

end
