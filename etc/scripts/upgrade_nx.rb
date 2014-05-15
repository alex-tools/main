#!/usr/bin/env ruby

require 'open-uri'
body = open("http://www.nomachine.com/preview/download-package.php?Prod_Id=4").read
package_uri = body[%r{http:.*?nxserver[^/]+\.deb}] or abort "Uri for debian package not found!"
# since we don't get the amd64 uri directly
package_uri.sub!('i386', 'amd64')
package_basename = package_uri[/nxserver.*\.deb$/] or abort "No basename for debian package found!"
puts "Installing latest package: #{package_uri}\n\n"

%[sudo apt-get --yes remove nxserver
sudo rm -rf '/usr/NX'
sudo rm -rf '/etc/NX'
sudo rm -rf /home/pair/.nx
mkdir -p "/home/pair/packages"
wget -O "/home/pair/packages/#{package_basename}" '#{package_uri}'
sudo dpkg --install '/home/pair/packages/#{package_basename}'
rm '/home/pair/packages/#{package_basename}'
].split("\n").each do |command|
  puts command
  system(command)
  abort "Command failed!: '#{command}'" unless $?.success?
end
