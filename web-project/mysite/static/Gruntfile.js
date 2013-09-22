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
      js: {
        src: ['lib/jquery-1.9.1.min.js',
        			'plugins/bootstrap.min.js', 
        			'plugins/jquery.validationEngine-zh_CN.js',
        			'plugins/jquery.validationEngine.js',
        			'plugins/plugins.custom.js',
        			'plugins/prettify.js',
        			'main/main.js'],
        dest: 'build/lpgray_build_<%= grunt.template.today("yyyymmdd") %>.js'
      }
    },
    uglify: {
      options: {
        banner: '<%= banner %>'
      },
      js: {
        src: '<%= concat.js.dest %>',
        dest: 'build/lpgray_build__<%= grunt.template.today("yyyymmdd") %>.min.js'
      }
    }
  });
  
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  
  grunt.registerTask('default', ['concat', 'uglify']);
};