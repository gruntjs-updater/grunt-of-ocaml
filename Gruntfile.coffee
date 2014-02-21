###
grunt-of-ocaml
https://github.com/woxtu/grunt-of-ocaml
 
Copyright (c) 2014 woxtu
Licensed under the MIT license.
###

module.exports = (grunt) ->

  grunt.initConfig

    ocaml:
      options:
        syntax: []
        package: []
      compile:
        files:
          'main.js': ['source/**.ml']

  grunt.loadTasks 'tasks'
  grunt.registerTask 'default', ['ocaml']
