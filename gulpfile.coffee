gulp = require 'gulp'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'

gulp.task 'coffee', ->
  gulp.src('./src/*.coffee')
    .pipe(coffee())
    .pipe(gulp.dest('./compiled'))

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
