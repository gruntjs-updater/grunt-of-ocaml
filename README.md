#grunt-of-ocaml

**grunt-of-ocaml** is a Grunt Plugin that compiles OCaml code to JavaScript using js_of_ocaml.

##Requirements

* Grunt

* OCaml batch compiler (ocamlc)

* Findlib (ocamlfind)

* js_of_ocaml

##Usage

Install this plugin:

```sh
$ npm install grunt-of-ocaml --save-dev
```

Include the task in your Gruntfile:

```coffee
grunt.loadNpmTasks 'grunt-of-ocaml'
```

Create a config block within your Gruntfile:

```coffee
module.exports = (grunt) ->

  grunt.initConfig

    ocaml:
      compile:
        files:
          'main.js': ['source/**.ml']

        options:

          # Use preprocessor with predicate
          syntax: []

          # Refer to package
          package: ['batteries']

          # Set optimization profile: 1 (default), 2, 3
          opt: 1
```

##License

Copyright (c) 2014 woxtu

Licensed under the MIT license.
