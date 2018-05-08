require "test_helper"

describe Customer do
  let(:customer) { Customer.new }

  it "must be valid" do
    value(customer).must_be :valid?
  end

  it "must not save if there is no name" do
  end
end
