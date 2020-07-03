world = [
  { region: "Europe", name: "Albania", population: 28748 },
  { region: "Europe", name: "Andorra", population: 468 },
  { region: "Europe", name: "Austria", population: 83871 },
  { region: "Europe", name: "Belarus", population: 207600 },
  { region: "Europe", name: "Belgium", population: 30528 },
  { region: "Europe", name: "Bosnia and Herzegovina", population: 51209 },
  { region: "Europe", name: "Bulgaria", population: 110879 },
  { region: "Europe", name: "Croatia", population: 56594 },
  { region: "Europe", name: "Czech Republic", population: 78865 },
  { region: "Europe", name: "Denmark", population: 43094 },
  { region: "Europe", name: "Estonia", population: 45227 },
  { region: "Europe", name: "Finland", population: 338424 },
  { region: "Europe", name: "France", population: 640679 },
  { region: "Europe", name: "Germany", population: 357114 },
]
# SELECT region, name, population
# FROM world as x
data = world.filter do |x| # The alias "x" (now our entire row is inside x)
  # THE INNER QUERY
  # SELECT population FROM world y WHERE y.region=x.region AND population>0
  # Get all the countries that are in the same continent as "x" with a population > 0
  innerQueryOutput = world.filter { |y| y[:region] == x[:region] && y[:population] > 0 }
  # Now for this part
  # WHERE population <= ALL
  # Check the current country "x" against all the countries in innerQueryOutput by checking if the current country's population is less than or equal to all of the countries in innerQueryOutput
  innerQueryOutput.all? { |inner| x[:population] <= inner[:population] }
end
puts data