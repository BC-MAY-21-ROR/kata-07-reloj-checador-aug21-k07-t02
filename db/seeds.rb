Admin.delete_all
Store.delete_all
Employee.delete_all

admin = Admin.create(name: 'Edson', email: 'test@test.com', user: 'admin', password_digest: 'admin')
store = Store.create(
  [
    { name: 'Juan store', address: '330 exito' },
    { name: 'one dollar store', address: '1902 prime street' },
    { name: 'oxxo', address: 'calle el triunfo' }
  ]
)
Employee.create(
  [
    { email: 'test@test.com', name: 'test', position: 'manager', private_number: '123456', active: true, admin_id: 1, store_id: 1 },
    { email: 'test1@test.com', name: 'test1', position: 'sales', private_number: '1234567', active: true, admin_id: 2, store_id: 2 },
    { email: 'test2@test.com', name: 'test2', position: 'bartender', private_number: '1234568', active: true, admin_id: 3, store_id: 3 }
  ]
)
