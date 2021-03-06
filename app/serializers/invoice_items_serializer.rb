class InvoiceItemsSerializer
  include FastJsonapi::ObjectSerializer

  attributes :unit_price do |obj|
    "%.2f" % (obj.unit_price.to_f / 100)
  end

  attributes :id, :quantity, :item_id, :invoice_id
end
