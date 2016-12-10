apt_update 'Update the apt cache daily' do
  frequency 86_400
  action :periodic # can also use :update to update every time chef runs
end

package 'apache2'  #default action is :install

service 'apache2' do
  supports :status=> true
  action [:enable, :start]
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
end
