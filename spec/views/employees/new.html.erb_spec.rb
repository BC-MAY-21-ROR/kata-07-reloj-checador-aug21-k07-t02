require 'rails_helper'

RSpec.describe "employees/new", type: :view do
  before(:each) do
    assign(:employee, Employee.new(
      email: "MyString",
      name: "MyString",
      position: "MyString",
      private_number: "MyString",
      active: false,
      admin: nil
    ))
  end

  it "renders new employee form" do
    render

    assert_select "form[action=?][method=?]", employees_path, "post" do

      assert_select "input[name=?]", "employee[email]"

      assert_select "input[name=?]", "employee[name]"

      assert_select "input[name=?]", "employee[position]"

      assert_select "input[name=?]", "employee[private_number]"

      assert_select "input[name=?]", "employee[active]"

      assert_select "input[name=?]", "employee[admin_id]"
    end
  end
end
