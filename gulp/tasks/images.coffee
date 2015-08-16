gulp = require 'gulp'
browserSync = require 'browser-sync'
reload = browserSync.reload

gulp.task 'images', ->
  gulp.src './app/i/*.png'
  .pipe gulp.dest('./build/i')
  .pipe reload({ stream: true })