class WithdrawalsController < ApplicationController

  before_filter :authenticate_user, :only => [:index, :new, :create, :show]

  def index
    @withdrawals = Withdrawal.all
  end

  def new
    @withdrawal = Withdrawal.new
  end

  def create
    @user = User.find(session[:user_id])
    @withdrawal = @user.withdrawals.create(withdrawals_params)

    redirect_to withdrawal_path(@withdrawal.id)
  end

  def show
    @withdrawal = Withdrawal.find(params[:id])
    @user = User.find(@withdrawal.user_id)
  end

  private
    def withdrawals_params
      params.require(:withdrawal).permit(:amount, :reason, :user)
    end

end
