gulp = require 'gulp'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
rimraf = require 'gulp-rimraf'

gulp.task 'coffee', ->
  gulp.src('./src/*.coffee')
    .pipe(coffee())
    .pipe(gulp.dest('./compiled'))

gulp.task 'rimraf', ->
  gulp.src('./dist/*.js')
    .pipe(rimraf())

gulp.task 'concat', ->
  gulp.src([
      './compiled/app.js'
      './compiled/utils.js'
    ])
      .pipe(concat('all.js'))
      .pipe(gulp.dest('./dist/'))

gulp.task 'compress', ->
  gulp.src('./dist/*.js')
    .pipe(uglify())
    .pipe(gulp.dest('./dist/'))


gulp.task 'watch', ->
  gulp.watch './src/*.coffee', (event) ->
    console.log "#{event.path}: #{event.type}"
    gulp.run 'default'


gulp.task 'default', ['coffee', 'rimraf', 'concat', 'compress']
