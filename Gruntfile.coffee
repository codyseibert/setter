fs = require 'fs'
path = require 'path'

module.exports = (grunt) ->
  require('load-grunt-tasks')(grunt)

  config =
    version: '0'
    name: 'linkr'
    user: 'linkr'
    rpms: 'rpms'
    tmp: 'tmp'
    client:
      dist: 'client/dist'
    server:
      dist: 'server/dist'

  grunt.initConfig
    config: config

    clean: [
      '<%= config.rpms %>'
      '<%= config.tmp %>'
    ]

    easy_rpm:
      options:
        name: "<%= config.name %>"
        version: "<%= config.version %>"
        release: 1
        buildArch: "noarch"
        defaultAttributes:
          mode: 755
          dirMode: 755
          user: '<%= config.user %>'
          group: '<%= config.user %>'
        preInstallScript: ['exit 0']
        postInstallScript: [
          'systemctl daemon-reload'
          'systemctl enable <%= config.name %>.service'
          'systemctl stop <%= config.name %>.service'
          'systemctl start <%= config.name %>.service'
        ]
        preUninstallScript: ['exit 0']
        tempDir: '<%= config.tmp %>'
        rpmDestination: '<%= config.rpms %>'

      release:
        files: [
          cwd: '<%= config.client.dist %>'
          src: '**/*'
          dest: "/home/<%= config.user %>/client"
          user: '<%= config.user %>'
          group: '<%= config.user %>'
        ,
          cwd: '<%= config.server.dist %>'
          src: '**/*'
          dest: "/home/<%= config.user %>/server"
          user: '<%= config.user %>'
          group: '<%= config.user %>'
        ,
          cwd: 'server/resources/systemd/'
          src: '*'
          dest: '/etc/systemd/system/'
          user: 'root'
          group: 'root'
        ,
          cwd: "server/templates"
          src: 'app.log'
          dest: '/var/log/<%= config.name %>'
          user: '<%= config.user %>'
          group: '<%= config.user %>'
        ,
          cwd: "server/templates"
          src: 'error.log'
          dest: '/var/log/<%= config.name %>'
          user: '<%= config.user %>'
          group: '<%= config.user %>'
        ]

  grunt.registerTask "distribute", ->
    if not grunt.option('build')?
      grunt.fail.fatal 'must supply --build=BUILD_NUMBER'
    else
      build = grunt.option('build')
      config.version = build
      grunt.task.run 'clean'
      grunt.task.run 'easy_rpm'

  return
