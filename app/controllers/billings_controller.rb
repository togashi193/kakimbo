class BillingsController < ApplicationController
  def index
    @billings = Billing.all.order(billing_date: "DESC")
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
