class hubot::package (
  $adapter,
  $repo_url,
  $repo_ref,
  $user,
  $group,
  $install_dir,
) {
  group { $group:
    ensure => 'present',
  }

  user { $user:
    home => $install_dir,
    gid  => $group,
  }

  vcsrepo { $install_dir:
    provider => 'git',
    source   => $repo_url,
    revision => $repo_ref,
    owner    => $user,
    group    => $group,
  }

  exec { 'npm_install_hubot':
    command     => '/usr/bin/npm install',
    cwd         => $install_dir,
    refreshonly => true,
    subscribe   => Vcsrepo[$install_dir],
    require     => Package['npm'],
  }
  #ensure_resource( 'package', "hubot-$adapter", { ensure => present, provider => 'npm' })
  #ensure_resource( 'nodejs::npm', "/opt/${user}:hubot-${adapter}", { ensure => present })
}
