class BillingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @billings = current_user.billings.order(billing_date: "DESC")
  end

  def create
    @billing = current_user.billings.create!(
      game: Game.find(params[:game]),
      billing_date: params[:date],
      amount: params[:amount],
      note: params[:note],
    )
  end

  def update
    @billing = current_user.billings.find_by!(id: params[:id])
    @billing.update!(
      game: Game.find(params[:game]),
      billing_date: params[:date],
      amount: params[:amount],
      note: params[:note],
    )
  end

  def destroy
    current_user.billings.find_by!(id: params[:id]).destroy!
  end

end
