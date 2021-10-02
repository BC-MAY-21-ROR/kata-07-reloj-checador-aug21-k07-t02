module EmployeesHelper
  def stores_for_select
    Store.all.map { |store| [store.name, store.id] }
  end
end
