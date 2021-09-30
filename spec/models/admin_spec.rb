require 'rails_helper'

RSpec.describe Admin, type: :model do
  it "should have many employee" do
    t = Admin.reflect_on_association(:employees)
    expect(t.macro).to eq(:has_many)
  end
end
