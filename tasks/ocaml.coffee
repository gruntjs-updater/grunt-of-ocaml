###
grunt-of-ocaml
https://github.com/woxtu/grunt-of-ocaml
 
Copyright (c) 2014 woxtu
Licensed under the MIT license.
###

module.exports = (grunt) ->
  grunt.registerMultiTask 'ocaml', 'Compile OCaml code to JavaScript with js_of_ocaml', () ->

    options = @options()
    done = @async()

    @files.forEach (f) ->
      syntax = ['-syntax'].concat (['camlp4o'].concat options.syntax).join ','
      package_ = ['-package'].concat (['js_of_ocaml', 'js_of_ocaml.syntax'].concat options.package).join ','

      files = f.src.filter (filepath) ->
        if !grunt.file.exists filepath
          grunt.log.warn "Source file #{filepath} not found."
          false
        else
          true

      args = ['ocamlc']
        .concat syntax
        .concat package_
        .concat ['-linkpkg', '-thread', '-o', 'out.byte']
        .concat files

      grunt.util.spawn cmd: 'ocamlfind', args: args, (error, result, code) ->
        if error
          grunt.fail.warn error
        else
          grunt.util.spawn cmd: 'js_of_ocaml', args: ['out.byte'], (error, result, code) ->
            if error
              grunt.fail.warn error
            else
              grunt.file.copy 'out.js', f.dest
              grunt.log.writeln "File #{f.dest} created."

              files.forEach (filepath) ->
                grunt.file.delete filepath.replace /^(.+?)\.ml/, '$1.cmi'
                grunt.file.delete filepath.replace /^(.+?)\.ml/, '$1.cmo'
              grunt.file.delete 'out.byte'
              grunt.file.delete 'out.js'
            done()
