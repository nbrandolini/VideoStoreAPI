require "test_helper"

describe Customer do
  let(:customer) { Customer.new(name: "Captain Planet", registered_at: "Wed, 29 Apr 2015 07:54:14 -0700", address: "123 Green St", city: "Tree Town", state: "HI", postal_code: "12345", phone: "(919) 434-3203") }

  it "must be valid" do
    value(customer).must_be :valid?
  end

  it "must not save if there is no name" do
    proc { Customer.new(address: "1234 Candy Cane Lane") }.must_change 'Customer.count', 0
  end

  it "must not save if name data is invalid" do
    proc { Customer.new(name: "1234") }.must_change 'Customer.count', 0
  end
end
