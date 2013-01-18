gdal_version = node['gdal']['version']

tarball = "gdal-#{gdal_version}.tar"
tarball_gz = "gdal-#{gdal_version}.tar.gz"
remote_file "/tmp/#{tarball_gz}" do
  source "http://download.osgeo.org/gdal/#{tarball_gz}"
  mode "0644"
  action :create_if_missing
end

bash "install_gdal_#{gdal_version}" do
  untar_dir = "/usr/local/src"
  user "root"
  code <<-EOH
    cd #{untar_dir} && \
    tar xzvf /tmp/#{tarball_gz} && \
    cd gdal-#{gdal_version} && \
    ./configure && make && make install && \
    ldconfig
  EOH
  command ""
  creates untar_dir + "/gdal-#{gdal_version}"
  action :run
end
