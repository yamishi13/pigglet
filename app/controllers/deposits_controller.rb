class DepositsController < ApplicationController

  before_filter :authenticate_user, :only => [:index, :new, :create, :show]

  def index
    @deposits = Deposit.all
  end

  def new
    @deposit = Deposit.new
  end

  def create
    @user = User.find(session[:user_id])
    @deposit = @user.deposits.create(deposit_params)

    redirect_to deposit_path(@deposit.id)
  end

  def show
    @deposit = Deposit.find(params[:id])
    @user = User.find(@deposit.user_id)
  end

  private
    def deposit_params
      params.require(:deposit).permit(:amount, :user)
    end
end
