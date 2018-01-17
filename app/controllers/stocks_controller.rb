class StocksController < ApplicationController

  def search
    if params[:stock].blank?
      flash.now[:danger] = "You need to provide a stock ticker symbol!"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "The stock symbol provided is not valid!" unless @stock
    end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end

end
