#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
Chassis.delete_all
Chassis.create([
  {name: 'Large'}, {name: 'Medium'}, {name: 'Small'}
])
