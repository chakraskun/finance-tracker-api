class InvoicesController < ApplicationController
  before_action :authorize_request
  # before_action :find_user, except: %i[create index]

  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      return render json: ::Dto::BaseResponse.created(
        data: {
          invoice: @invoice
        }
      )
    else
      render json: ::Dto::BaseResponse.unprocessable_entity(
        message: @invoice.errors.full_messages
      )
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(
      :invoice_type, :price, :description, :user_id,
      :date
    )
  end
end
