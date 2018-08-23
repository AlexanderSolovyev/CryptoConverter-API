class HistoryController < ApplicationController
  def converter
    @history=History.new(currency_params)
    @history.convert
      if @history.save
        render json: { ok: @history.amount2 }, status: 200
      else
        render json: { error: @history.errors }, status: 200
      end
  end

  def list
    currs = []
    Currency.select(:symbol).each{ |c| currs << c.symbol }
    crypto =[]
    Cryptocurrency.select(:symbol).each{|c| crypto << c.symbol }
    render json: { currencies: currs, cryptocurrencies: crypto }, status: 200
  end

  def history
    @history =History.last(params[:limit] ||10)
    render json: { ok: @history }, status: 200
  end

  private

  def currency_params
    params.permit(:currency1, :currency2, :amount1)
  end
end
