gulp = require 'gulp'
browserify = require 'gulp-browserify'
clean = require 'gulp-clean'
del = require 'del'
coffee = require 'gulp-coffee'
gutil = require 'gulp-util'
jade = require 'gulp-jade'
sass = require 'gulp-sass'
ngTemplates = require 'gulp-ng-templates'
gulpIgnore = require 'gulp-ignore'
connect = require 'gulp-connect'
proxy = require 'http-proxy-middleware'
modRewrite = require 'connect-modrewrite'

gulp.task 'clean', ->
  del.sync [ 'tmp', 'build', 'dist' ]

gulp.task 'fonts', ->
  gulp.src('node_modules/bootstrap/fonts/*')
    .pipe gulp.dest('dist/fonts')

gulp.task 'copy', ['jade'], ->
  gulp.src('tmp/templates/index.html')
    .pipe gulp.dest('dist')
    .pipe connect.reload()

  gulp.src('node_modules/angular-ui-grid/ui-grid.ttf')
    .pipe gulp.dest('dist')

  gulp.src('node_modules/angular-ui-grid/ui-grid.woff')
    .pipe gulp.dest('dist')

  gulp.src('assets/**/*')
    .pipe gulp.dest('dist/assets')

gulp.task 'jade', ->
  gulp.src 'src/**/*.jade'
    .pipe jade
      pretty: true
    .pipe gulp.dest 'tmp/templates'

gulp.task 'templates', ['jade'], ->
  gulp.src ['tmp/templates/**/*.html', '!tmp/templates/index.html']
    .pipe ngTemplates
      filename: 'templates.js'
      module: 'setter'
      standalone: false
    .pipe gulp.dest 'dist'
    .pipe connect.reload()

gulp.task 'sass', ->
  gulp.src('src/app.sass')
    .pipe(sass().on('error', gutil.log))
    .pipe(gulp.dest('dist'))
    .pipe connect.reload()

gulp.task 'coffee', ->
  gulp.src('src/**/*.coffee')
    .pipe(coffee({bare: true})
    .on('error', gutil.log))
    .pipe(gulp.dest('tmp/js'))

gulp.task 'scripts', ['coffee'], ->
  gulp.src('tmp/js/app.js')
    .pipe(browserify({}))
    .pipe(gulp.dest('dist'))
    .pipe connect.reload()

gulp.task 'connect', ->
  connect.server
    root: 'dist'
    livereload: true
    middleware: (connect, opt) ->
      [
        modRewrite([
          '^/api/(.*)$ http://localhost:8081/$1 [P]'
        ])
      ]

gulp.task 'watch', ->
  gulp.watch 'src/index.jade', [
    'copy'
  ]

  gulp.watch ['src/**/*.jade', '!src/index.html'], [
    'templates'
  ]

  gulp.watch 'src/**/*.sass', [
    'sass'
  ]

  gulp.watch 'src/**/*.coffee', [
    'scripts'
  ]

gulp.task 'build', [
  'clean'
  'jade'
  'templates'
  'coffee'
  'scripts'
  'sass'
  'copy'
  'fonts'
]

gulp.task 'default', [
  'build'
  'connect'
  'watch'
]
