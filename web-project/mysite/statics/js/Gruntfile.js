/*global module:false*/
module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    // Metadata.
    meta: {
      version: '0.1.0'
    },
    banner: '/*! rayzy1991 - v<%= meta.version %> - ' +
      '<%= grunt.template.today("yyyy-mm-dd") %>\n' +
      '* http://rayzy1991.sinaapp.com/\n' +
      '* Copyright (c) <%= grunt.template.today("yyyy") %> ' +
      'Zhang Yang; Licensed MIT */\n',
    // Task configuration.
    concat: {
      options: {
        banner: '<%= banner %>',
        stripBanners: true
      },
      dist: {
        src: ['lib/jquery-1.9.1.min.js', 
        			'plugins/bootstrap.min.js', 
        			'plugins/jquery.validationEngine-zh_CN.js',
        			'plugins/jquery.validationEngine.js',
        			'plugins/plugins.custom.js',
        			'plugins/prettify.js',
        			'main/main.js'],
        dest: 'dist/concat_jq_plug_main.js'
      }
    },
    uglify: {
      options: {
        banner: '<%= banner %>'
      },
      dist: {
        src: '<%= concat.dist.dest %>',
        dest: 'dist/packed_' + new Date().getMilliseconds() + '.min.js'
      }
    }
  });

  // These plugins provide necessary tasks.
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  // grunt.loadNpmTasks('grunt-contrib-qunit');
  // grunt.loadNpmTasks('grunt-contrib-jshint');
  // grunt.loadNpmTasks('grunt-contrib-watch');

  // Default task.
  grunt.registerTask('default', ['concat', 'uglify']);

};