require 'rails_helper'

RSpec.describe Store, type: :model do
  it 'should have many employees' do
    store = Store.reflect_on_association(:employees)
    expect(store.macro).to eq(:has_many)
  end
end
