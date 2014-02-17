clear
#server rails
rails server -p 80 -b 192.168.2.21
# Si instalas el servidor thin: gem install thin y se define en el archivo Gem del proyecto
# para ejecutarlo seria:
# thin -p 80 -a 192.168.48.1 start