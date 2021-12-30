class InvoicesController < ApplicationController
  before_action :authorize_request
  before_action :find_invoice, except: %i[create, index]

  def index
    invoices = Invoice.all
    invoices_serializer = InvoiceSerializer.new(invoices).attributes
    return render json: ::Dto::BaseResponse.ok(
      data: {
        invoices: invoices_serializer
      }
    )
  end
  
  def show
    unless @invoice.present?
      return render json: ::Dto::BaseResponse.bad_request(
        message: "Invoice Not Found"
      )
    end
    return render json: ::Dto::BaseResponse.ok(
      data: {
        invoice: InvoiceSerializer.new(@invoice).attributes
      }
    )
  end
  
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
    def find_invoice
      @invoice ||= Invoice.find_by(id: params[:id])
    end

    def invoice_params
      params.require(:invoice).permit(
        :invoice_type, :price, :description, :user_id,
        :date
      )
    end
end
