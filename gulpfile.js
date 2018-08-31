const gulp = require('gulp');
var $    = require('gulp-load-plugins')();
const sass = require('gulp-sass');
const autoprefixer = require('gulp-autoprefixer');
var sassPaths = [
  './foundation/node_modules/foundation-sites/scss',
  './foundation/node_modules/motion-ui/src'
];

gulp.task('sass', function() {
  return gulp.src('./src/assets/scss/*.scss')
    .pipe($.sass({
      includePaths: sassPaths,
      outputStyle: 'compact' // if css compressed **file size**
    })
      .on('error', $.sass.logError))
    .pipe($.autoprefixer({
      browsers: ['last 2 versions', 'ie >= 9']
    }))
    .pipe(gulp.dest('./src/assets/css'));
});

gulp.task('default', ['sass'], function() {
  gulp.watch(['./src/assets/scss/**/*.scss'], ['sass']);
});