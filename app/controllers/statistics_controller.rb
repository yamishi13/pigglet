class StatisticsController < ApplicationController
  
  before_filter :authenticate_user, :only => [:index]

  def index
    @w_total = 0
    @d_total = 0
    @total = 0

    @withdrawals = Withdrawal.all
    @withdrawals.each do |w|
       @w_total += w.amount
    end

    @deposits = Deposit.all
    @deposits.each do |d|
      @d_total += d.amount
    end

    @total = @d_total - @w_total

  end

end
