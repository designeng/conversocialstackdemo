module.exports = (grunt) ->

    # load all grunt tasks
    grunt.loadNpmTasks('grunt-contrib-connect')
    grunt.loadNpmTasks('grunt-contrib-copy')
    grunt.loadNpmTasks('grunt-contrib-coffee')
    grunt.loadNpmTasks('grunt-contrib-sass')
    grunt.loadNpmTasks('grunt-contrib-watch')
    grunt.loadNpmTasks('grunt-contrib-clean')
    grunt.loadNpmTasks('grunt-contrib-jasmine')

    # set up config
    cjsLoader = moduleLoader: 'curl/loader/cjsm11'
    grunt.initConfig

        jasmine: 
            tests: 
                options: 
                    specs: ["tests/**/*.js"]                    

            options:
                template: require('grunt-template-jasmine-curljs')
                templateOptions:
                    curlConfig: 
                        paths:
                            'jquery': 'lib/jquery/jquery'
                        packages: [
                            { name: 'curl', location: 'lib/curl/src/curl' }
                            { name: 'underscore', location: 'lib/lodash/dist', main: 'lodash.compat'}
                            { name: 'lodash', location: 'lib/lodash/dist', main: 'lodash.compat'}
                            { name: 'backbone', location: 'lib/backbone', main: 'backbone', config: cjsLoader }
                            { name: 'knockout', location: 'lib/knockout/build/output', main: 'knockout-latest' }
                            { name: 'knockback', location: 'lib/knockback', main: 'knockback'}
                            { name: 'wire', location: 'lib/wire', main: 'wire' }
                            { name: 'meld', location: 'lib/meld', main: 'meld' }
                            { name: 'when', location: 'lib/when', main: 'when' }
                            { name: 'poly', location: 'lib/poly' }
                        ]
                #helpers : ['tests/helpers/*.js']
                #vendor: ['',]        

        sass:
            main: 
                files:
                    'www/css/layout.css': 'app/scss/layout.scss'
                    'www/css/bootstrap.css': 'app/scss/bootstrap.scss'

        connect:
            server:
                options:
                    port: 8000,    
                    hostname: '0.0.0.0'
                    base: 'www'

        coffee:
            glob_to_multiple:
                expand: true,
                cwd: 'app/',
                src: ['**/**/*.coffee'],
                dest: 'www/',
                ext: '.js'

        watch: 
            coffee:
                tasks: ['coffee']
                files: ['app/**/*.coffee']
                options: 
                    livereload: true
            html:
                tasks: ['copy:static']
                files: ['app/**/*.html']
                options: 
                    livereload: true


        clean: ['www']            

        copy:
            lib: 
                files: 
                    [
                        {expand: true, src: ['lib/**'], dest: 'www/'},
                        {expand: true, cwd:'app/json', src: ['*'], dest: 'www/json'}
                    ]
            static: 
                files: 
                    [
                        {src: 'app/index.html', dest: 'www/index.html'},
                        {expand: true, cwd: 'app', src: ['views/**/*'], dest: 'www/'}
                        {expand: true, cwd: 'app/js/components/', src: ['**/*.html'], dest: 'www/views'}
                    ]

    # register tasjs
    grunt.registerTask('default', ['clean', 'coffee', 'copy', 'sass', 'connect', 'watch'])
