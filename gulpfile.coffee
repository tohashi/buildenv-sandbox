gulp = require 'gulp'
concat = require 'gulp-concat'

gulp.task 'concat', ->
  gulp.src('./src/*.js')
    .pipe(concat('all.js'))
    .pipe(gulp.dest('./dist/'))
