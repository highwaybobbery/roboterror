#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
Chassis.delete_all
Chassis.create([
  {name: 'Large'}, {name: 'Medium'}, {name: 'Small'}
], :without_protection => true)

Stat.delete_all
Stat.create([
  {name: 'health', price: 1, price_growth: 0.1},
  {name: 'speed', price: 5, price_growth: 0.2},
  {name: 'charge', price: 2, price_growth: 0.1},
  {name: 'power', price: 2 , price_growth: 0.2},
  {name: 'shield strength', price: 3, price_growth: 0.2},
  {name: 'shield absorbtion', price:6 , price_growth: 0.3},
  {name: 'damage', price: 4, price_growth: 0.3}
], :without_protection => true)
