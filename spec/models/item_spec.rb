require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relations' do
    it { should belong_to :merchant }
    it { should have_many :invoice_items }
    it { should have_many :invoices }
  end
end
