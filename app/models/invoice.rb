class Invoice
  include Mongoid::Document
  include Mongoid::Timestamps

  field :invoice_type, type: String
  field :description, type: String
  field :user_id, type: String
  field :price, type: Money

end