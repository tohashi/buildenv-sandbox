gulp = require 'gulp'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'

gulp.task 'concat', ->
  gulp.src([
    './src/intro.js',
    './src/app.js',
    './src/outro.js'
  ])
    .pipe(concat('all.js'))
    .pipe(gulp.dest('./dist/'))

gulp.task 'compress', ->
  gulp.src('./dist/*.js')
    .pipe(uglify())
    .pipe(gulp.dest('./dist/'))

gulp.task 'default', ['concat', 'compress']
