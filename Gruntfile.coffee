###
grunt-of-ocaml
https://github.com/woxtu/grunt-of-ocaml
 
Copyright (c) 2014 woxtu
Licensed under the MIT license.
###

module.exports = (grunt) ->

  grunt.initConfig

    ocaml:
      compile:
        files:
          'main.js': ['source/**.ml']
        options:
          syntax: []
          package: []

  grunt.loadTasks 'tasks'
  grunt.registerTask 'default', ['ocaml']
