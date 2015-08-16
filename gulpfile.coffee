gulp = require 'gulp'
requireDir = require 'require-dir'
runSequence = require 'run-sequence'

requireDir './gulp/tasks', recurse: true

gulp.task 'default', ['server']

gulp.task 'build', ['clean'], (cb) ->
  runSequence ['partials', 'scripts', 'html', 'sass', 'images'], cb

gulp.task 'server', ['setWatch', 'build'], ->
  gulp.start 'watch'