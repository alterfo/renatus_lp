
gulp = require 'gulp'
fileinclude = require 'gulp-file-include'
rename = require 'gulp-rename'
browserSync = require 'browser-sync'
reload = browserSync.reload



gulp.task 'partials', ->
  gulp.src './app/html/partials/*.tpl.html'
  .pipe fileinclude()
  .pipe rename
    extname: ""
  .pipe rename
    extname: ".html"
  .pipe gulp.dest('./app/html/')