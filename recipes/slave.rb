node[:jenkins][:slaves].each do |slave|
  jenkins_ssh_slave "#{slave}" do
    description 'Jenkins Slave Server'
    remote_fs   '/mnt/ephemeral/jenkins-slave'
    host        "#{slave}"
    user        'jenkins-slave'
    credentials 'jenkins-slave'
  end

  jenkins_slave "#{slave}" do
    action :connect
  end

  jenkins_slave "#{slave}" do
    action :online
  end
end
