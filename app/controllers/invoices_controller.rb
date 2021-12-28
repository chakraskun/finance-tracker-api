class InvoicesController < ApplicationController
  before_action :authorize_request
  # before_action :find_user, except: %i[create index]

  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      render json: @invoice, status: :created
    else
      render json: { errors: @invoice.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(
      :invoice_type, :price, :description, :user_id
    )
  end
end
