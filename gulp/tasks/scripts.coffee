_ = require 'lodash'
gulp = require 'gulp'

coffeeify = require 'coffeeify'
watchify = require 'watchify'
source = require 'vinyl-source-stream'
bundleLogger = require '../util/bundleLogger'
handleErrors = require '../util/handleErrors'

browserify = require 'browserify'


dependencies =
  lodash: './node_modules/lodash'
  jquery: './node_modules/jquery'
  foundation: './node_modules/foundation-sites'

gulp.task 'scripts', ->
	# client

	clientBundler = browserify
		cache: {}, packageCache: {}
		entries: './app/js/main.js'
		extensions: ['.cjsx', '.coffee']

	_.forEach dependencies, (path, dep) ->
		clientBundler.external dep

	rebundle = ->
		bundleLogger.start 'client.js'

		clientBundler.bundle()
		  .on 'error', handleErrors
		  .pipe source('client.js')
		  .pipe gulp.dest('./build/js')
		  .on 'end', ->
		    bundleLogger.end 'client.js'

	if global.isWatching
		clientBundler = watchify clientBundler
		clientBundler.on 'update', rebundle
	rebundle()

	#==========  Vendor bundler  ==========#

	vendorBundler = browserify
		cache: {}, packageCache: {}
		extensions: ['.coffee']

	_.forEach dependencies, (path, dep) ->
		vendorBundler.require path, expose: dep

	bundleLogger.start 'vendor.js'

	vendorBundler.bundle()
		.on 'error', handleErrors
		.pipe source('vendor.js')
		.pipe gulp.dest('./build/js')
		.on 'end', ->
			bundleLogger.end 'vendor.js'