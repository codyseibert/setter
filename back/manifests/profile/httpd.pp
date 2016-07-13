class setter::profile::httpd (
) {

  if defined (Firewall['100 http(s) access']) == false {
    firewall { '100 http(s) access':
      dport   => [80, 443],
      proto  => tcp,
      action => accept,
    }
  }

  if defined(Class['apache']) == false {
    class { 'apache':
      default_vhost => false,
      default_mods  => false,
    }
  }

  include apache::mod::php
  include apache::mod::dir
  include apache::mod::headers
  include apache::mod::filter
  include apache::mod::proxy
  include apache::mod::proxy_http
  include apache::mod::deflate
  include apache::mod::rewrite

  $filters = [
    'FilterDeclare   COMPRESS',
    "FilterProvider  COMPRESS DEFLATE \"%{Content_Type} = 'text/html'\"",
    "FilterProvider  COMPRESS DEFLATE \"%{Content_Type} = 'text/css'\"",
    "FilterProvider  COMPRESS DEFLATE \"%{Content_Type} = 'text/plain'\"",
    "FilterProvider  COMPRESS DEFLATE \"%{Content_Type} = 'application/json'\"",
    "FilterProvider  COMPRESS DEFLATE \"%{Content_Type} = 'application/javascript'\"",
    "FilterProvider  COMPRESS DEFLATE \"%{Content_Type} = 'image/svg+xml'\"",
    'FilterChain     COMPRESS',
    'FilterProtocol  COMPRESS DEFLATE change=yes;byteranges=no',
  ]

  if defined(Apache::Vhost['localhost']) == false {

    apache::vhost { 'localhost':
      servername      => 'localhost',
      docroot    => "/var/www/html",
      port    => '80',
      directories => [
        {
          path => '/var/www/html',
          directoryindex => 'index.html',
          rewrites => [
            {
              comment      => ' Normal Files',
              rewrite_cond => ['%{REQUEST_FILENAME} -f [OR]', '%{REQUEST_FILENAME} -d'],
              rewrite_rule => ['^ - [L]'],
            },
            {
              comment      => ' Unknown Files',
              rewrite_rule => ['^ index.html [L]'],
            }
          ]
        }
      ],
      proxy_pass => [
        {
          'path' => '/api',
          'url' => "http://localhost:8081"
        }
      ],
      filters => $filters,
    }
  }

  if defined(Selboolean['httpd_can_network_connect']) == false {
    selboolean { 'httpd_can_network_connect':
      persistent => true,
      value      => 'on',
    }
  }

  if defined (Service['httpd']) == false {
    service { 'httpd':
      enable => true,
      ensure => "running",
      require => Class['apache'],
    }
  }

}
