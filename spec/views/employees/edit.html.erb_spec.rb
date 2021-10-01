require 'rails_helper'

RSpec.describe "employees/edit", type: :view do
  before(:each) do
    @employee = assign(:employee, Employee.create!(
      email: "MyString",
      name: "MyString",
      position: "MyString",
      private_number: "MyString",
      active: false,
      admin: nil
    ))
  end

  it "renders the edit employee form" do
    render

    assert_select "form[action=?][method=?]", employee_path(@employee), "post" do

      assert_select "input[name=?]", "employee[email]"

      assert_select "input[name=?]", "employee[name]"

      assert_select "input[name=?]", "employee[position]"

      assert_select "input[name=?]", "employee[private_number]"

      assert_select "input[name=?]", "employee[active]"

      assert_select "input[name=?]", "employee[admin_id]"
    end
  end
end
