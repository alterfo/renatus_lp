gulp = require 'gulp'
browserSync = require 'browser-sync'
reload = browserSync.reload

gulp.task 'images', ->
  gulp.src './app/i/*.{jpg,png,gif}'
  .pipe gulp.dest('./build/i')
  .pipe reload({ stream: true })