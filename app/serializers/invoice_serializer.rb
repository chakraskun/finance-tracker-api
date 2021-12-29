class InvoiceSerializer < BaseSerializer

  attributes :id, :invoice_type, :user_id,
    :description

  attributes :date do |object|
    readable_date(object.created_at)
  end

  attributes :price do |object|
    object.price.format
  end
end