class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :items
  has_many :invoice_items, through: :invoices

  def self.by_total_revenue(limit)
    select("merchants.*, SUM(invoice_items.quantity*invoice_items.unit_price) AS revenue")
      .joins(:invoice_items, :transactions)
      .group(:id)
      .order("revenue DESC")
      .limit(limit)
  end

  def self.by_items_sold(limit)
    select("merchants.*, SUM(invoice_items.quantity) AS items_sold")
      .joins(:invoice_items)
      .group(:id)
      .order("items_sold DESC")
      .limit(limit)
  end
end
