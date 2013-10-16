module.exports = function(grunt) {
  grunt.initConfig({
    meta: {
      version: '0.1.0'
    },
    banner: '/*! lpgray-site <%= grunt.template.today("yyyy-mm-dd") %> */\n',
    concat: {
      options: {
        banner: '<%= banner %>',
        stripBanners: true
      },
      jslib: {
        src: ['js/jquery-1.9.1.min.js',
              'prettify.js',
              'bootstrap.min.js', 
              'func.pagin.js',
              'gtmap.formvalidate.js',
              'base.js', 'main.js'],
        dest: 'build/js/lpgray_global_<%= grunt.template.today("yyyymmdd") %>.js'
      }
    },
    uglify: {
      options: {
        banner: '<%= banner %>'
      },
      js: {
        src: '<%= concat.js.dest %>',
        dest: 'build/lpgray_global_<%= grunt.template.today("yyyymmdd") %>.min.js'
      }
    }
  });
  
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  
  grunt.registerTask('default', ['concat', 'uglify']);
};