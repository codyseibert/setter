class setter::profile::db (
) {

  if defined (Class['::mysql::server']) == false {
    class { '::mysql::server':
      databases   => {
        'setter'  => {
          ensure  => 'present',
          charset => 'utf8',
        },
      },
      grants => {
        'root@localhost/setter.*' => {
          ensure     => 'present',
          options    => ['GRANT'],
          privileges => ['SELECT', 'INSERT', 'CREATE', 'UPDATE', 'DELETE'],
          table      => 'setter.*',
          user       => 'root@localhost',
        },
      },
      remove_default_accounts => true,
      users => {
        'root@localhost' => {
          ensure                   => 'present',
          max_connections_per_hour => '0',
          max_queries_per_hour     => '0',
          max_updates_per_hour     => '0',
          max_user_connections     => '0',
          password_hash            => '*AC57754462B6D4C373263062D60EDC6E452E574D',
        }
      }
    }
  }

}
