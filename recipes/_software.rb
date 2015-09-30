%w[make patch gcc g++ subversion mercurial git maven].each do |pkg|
  package pkg do
    action :install
  end
end
