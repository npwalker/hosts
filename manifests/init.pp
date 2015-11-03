class hosts {

  #For example purpose I've hardcoded this hash
  #You would probably provide this data via hiera
  $hosts_hash = {   'test-server-1' => {
      'ensure' => 'present',
      'ip' => '10.10.44.55'
    }, 
  'test-server-2' => {
      'ensure' => 'present',
      'ip' => '10.10.44.58',
      'host_aliases' => [ 'test-server-2.domain.com' ]
    }
  }

  #notify { "${hosts_hash}" :}

  $hosts_hash.each | $key, $value | {

    host { $key :
      ensure       => $value['ensure'],
      ip           => $value['ip'],
      host_aliases => $value['host_aliases'],
    }
  }
}
