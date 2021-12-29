class DashboardController < ApplicationController
  before_action :authorize_request
  before_action :setup_summarize_value

  def index
    render json: ::Dto::BaseResponse.ok(
      data: {
        total_expense: @total_expense.format,
        total_income: @total_income.format,
        available_money: @available_money.format
      }
    )
  end

  private
    def setup_summarize_value
      @total_expense = Invoice.where(invoice_type: 'expense').sum('price.cents').to_money
      @total_income = Invoice.where(invoice_type: 'income').sum('price.cents').to_money
      @available_money = @total_income - @total_expense
    end
end