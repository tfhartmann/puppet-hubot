class { 'hubot':
  adapter  => ['hipchat'],
  repo_url => 'https://github.com/huit/hubot-nocbot.git',
  repo_ref => 'master',
  env_vars => { 'HUBOT_HIPCHAT_JID' => '',
                'HUBOT_HIPCHAT_PASSWORD' => '',
                'HUBOT_HIPCHAT_ROOMS' => '' },
} 
