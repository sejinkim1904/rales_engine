class Api::V1::Invoices::FindController < ApplicationController
  def show
    render json: InvoiceSerializer.new(Invoice.find_by(find_params))
  end

  def index
    render json: InvoiceSerializer.new(Invoice.where(find_params))
  end

  private

  def find_params
    params.permit(
      :id,
      :status,
      :customer_id,
      :merchant_id,
      :created_at,
      :updated_at
    )
  end
end
