const gulp = require('gulp');
const $ = require('gulp-load-plugins')();
const sass = require('gulp-sass');
const autoprefixer = require('gulp-autoprefixer');
const sassPaths = [
  './foundation/node_modules/foundation-sites/scss',
  './foundation/node_modules/motion-ui/src'
];
const postcss = require('gulp-postcss');
const uncss = require('postcss-uncss');
const cssnano = require('cssnano');
const exec = require('child_process').exec;
var browserSync = require('browser-sync').create();

gulp.task('sass', function() {
  return gulp.src('./src/assets/scss/**/*.scss')
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

gulp.task('build', function() {
  exec('node ./scripts/build');
});

gulp.task('style-move', function() {
  return gulp.src('./src/assets/css/*.css')
    .pipe(gulp.dest('./docs/assets/css'));
});

gulp.task('serve', ['sass'], function() {
  browserSync.init({
    server: "./"
  });

  gulp.watch("src/assets/scss/**/*.scss", ['sass']);
  gulp.watch("src/assets/css/*.css", ['style-move']);
  gulp.watch("src/**/*.+(ejs|json|js|png|jpg|svg|sql|pdf|md|csv)", ['build']).on('change', browserSync.reload);
});

gulp.task('prod', function() {
  var plugins = [
    // add back in once you can exclude hljs
    // uncss({
    //     ignoreSheets : ['reveals.css'],
    //     html: ['./docs/**/*.html']
    // }),
    cssnano({
      discardComments: { removeAll: true }
    })
  ];
  return gulp.src('./src/assets/css/*.css')
    .pipe(postcss(plugins))
    .pipe(gulp.dest('./docs/assets/css'));
});

gulp.task('default', ['serve']);