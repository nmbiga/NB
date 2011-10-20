require "rubygems"
require "bundler/setup"

puts ("Lista de Gemas en Uso: \n-------")

Gem.loaded_specs.values.sort.each do |val|
  
  print val.name," // ",val.version,"\n"

end
puts ("-------")




