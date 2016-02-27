fs = require 'fs'
path = require 'path'
ncp = require 'ncp'
mkdirp = require 'mkdirp'

module.exports = (grunt) ->
  require('load-grunt-tasks')(grunt)

  config =
    rpmName: 'linkr-api'
    rpmVersion: '0'
    dist: 'dist'

  grunt.initConfig
    config: config

    clean: [
      'rpms'
    ]

    copy_node_deps:
      dist:
        packageJson: './package.json'
        dest: 'dist/node_modules'

    easy_rpm:
      options:
        name: "<%= config.rpmName %>"
        version: "<%= config.rpmVersion %>"
        release: 1
        buildArch: "noarch"
        defaultAttributes:
          mode: 755
          dirMode: 755
          user: 'linkr'
          group: 'linkr'
        preInstallScript: ['exit 0']
        postInstallScript: [
          'systemctl daemon-reload'
          'systemctl enable <%= config.rpmName %>.service'
          'systemctl stop <%= config.rpmName %>.service'
          'systemctl start <%= config.rpmName %>.service'
        ]
        preUninstallScript: ['exit 0']
        tempDir: 'tmp'
        rpmDestination: 'rpms'

      release:
        files: [
          cwd: '<%= config.dist %>'
          src: '**/*'
          dest: "/home/linkr/<%= config.rpmName %>"
          user: 'linkr'
          group: 'linkr'
        ,
          cwd: 'resources/systemd/'
          src: '*'
          dest: '/etc/systemd/system/'
          user: 'root'
          group: 'root'
        ,
          cwd: "templates"
          src: 'app.log'
          dest: '/var/log/<%= config.rpmName %>'
          user: 'linkr'
          group: 'linkr'
        ,
          cwd: "templates"
          src: 'error.log'
          dest: '/var/log/<%= config.rpmName %>'
          user: 'linkr'
          group: 'linkr'
        ]

  grunt.task.registerMultiTask 'copy_node_deps', 'A task which loops through the package.json, finds the production dependencies, and copies them into a dist folder', ->
    packageJson = require this.data.packageJson
    names = []
    done = this.async()

    for name, version of packageJson.dependencies
      names.push name

    mkdirp this.data.dest, =>
      count = names.length
      for name in names
        src = path.resolve __dirname, "node_modules", name
        dest = path.resolve __dirname, this.data.dest, name
        options =
          dereference: true
          clobber: true
        ncp src, dest, options, (err) ->
          grunt.log.error err if err?
          count--
          if count is 0
            done()

  grunt.registerTask "distribute", ->
    if not grunt.option('build')?
      grunt.fail.fatal 'must supply --build=BUILD_NUMBER'
    else
      build = grunt.option('build')
      config.rpmVersion = build
      grunt.task.run 'clean'
      grunt.task.run 'copy_node_deps:dist'
      grunt.task.run 'easy_rpm'


  return
