gulp = require 'gulp'
clean = require 'gulp-clean'
del = require 'del'
coffee = require 'gulp-coffee'
gutil = require 'gulp-util'
nodemon = require 'gulp-nodemon'
path = require('path')
exec = require('child_process').exec
async = require('async')
sync = require('gulp-sync')(gulp)
rimraf = require('rimraf')
require('gulp-grunt')(gulp)

gulp.task 'nodemon', ->
  nodemon
    script: 'dist/server.js'
    ext: 'js'

gulp.task 'clean', ->
  del.sync [ 'dist' ]

gulp.task 'coffee', ->
  gulp.src('src/**/*.coffee')
    .pipe(coffee({bare: true})
    .on('error', gutil.log))
    .pipe(gulp.dest('dist'))

gulp.task 'watch', ->
  gulp.watch 'src/**/*.coffee', [
    'coffee'
  ]

gulp.task 'build', sync.sync [
  'clean'
  'coffee'
  'grunt-copy_node_deps'
]

gulp.task 'default', sync.sync [
  'build'
  'nodemon'
  'watch'
]
