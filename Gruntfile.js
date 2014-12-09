module.exports = function(grunt) {
    require('load-grunt-tasks')(grunt, {pattern: ['grunt-*','karama']});

    grunt.loadNpmTasks('grunt-istanbul');
    grunt.loadNpmTasks('grunt-istanbul-coverage');
    grunt.loadNpmTasks('grunt-env');

    grunt.initConfig({

        pkg: grunt.file.readJSON('package.json'),

        concat: {
            options: {
                separator: ';',
            },
            client: {
                src: ['src/public/js/**/*.js'],
                dest: 'build/tmp/app.js',
            },
        },

        jshint: {
            server: [
                'src/*.js',
                'src/routes/*.js'
            ],
            client: [
                'src/public/js/**/*.js'
            ],
        },

        uglify: {
            options: {
                banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
            },
            client: {
                src: 'build/tmp/app.js',
                dest: 'build/app/public/js/app.min.js'
            }
        },

        clean: {
            build: {
                src: [
                    "coverage"
                ]
            }
        },
        coverage: {
            options: {
                thresholds:{
                    'statements': 90,
                    'branches': 90,
                    'lines': 90,
                    'functions': 90
                },
                dir: 'coverage/reports',
                root: './'
            },
        },
        env: {
            coverage: {
                APP_DIR_FOR_CODE_COVERAGE: '/coverage/instrument/src/'
            }
        },
        instrument: {
            files: [
                'src/*.js',
                'src/routes/*.js',
                'src/auth/*.js',
                'src/dao/*.js'
            ],
            options: {
                lazy: true,
                basePath: 'coverage/instrument/'
            }
        },
        mochaTest: {
            test: {
                options: {
                    reporter: 'spec',
                    captureFile: 'results.txt',
                    quiet: false,
                    clearRequireCache: false
                },
                src: ['test/**/*.js']
            }
        },
        storeCoverage: {
            options: {
                dir: 'coverage/reports'
            }
        },
        makeReport: {
            src: 'coverage/reports/**/*.json',
            options: {
                type: 'lcov',
                dir: 'coverage/reports',
                print: 'detail'
            }
        },





        copy: {
            server: {
                files: [
                    {
                        expand: true,
                        flatten: false,
                        cwd: 'src',
                        src: [
                            '*.js',
                            'routes/*.js',
                            'dao/*.js',
                            'auth/*.js'
                        ],
                        dest: 'build/app/',
                        filter: 'isFile'
                    },
                ],
            },

            client: {
                files: [
                    {
                        expand: true,
                        flatten: false,
                        cwd: 'src',
                        src: [
                            'public/font/**',
                            'public/images/**',
                            'public/templates/**',
                            'public/css/fontello.css',
                            'public/bower_components/**'
                        ],
                        dest: 'build/app',
                        filter: 'isFile'
                    },
                ],
            },

            node: {
                files: [
                    {
                        expand: true,
                        flatten: false,
                        src: [
                            'node_modules/**'
                        ],
                        dest: 'build/app/',
                        filter: 'isFile'
                    },
                ],
            },
        },

        cssmin: {
            add_banner: {
                options: {
                    banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
                },
                files: {
                    'build/app/public/css/app.min.css': ['src/public/css/app.css']
                }
            }
        },

        htmlmin: {
            dist: {
                options: {
                    removeComments: true,
                    collapseWhitespace: true
                },
                files: {
                    'build/app/public/index.html': 'src/public/index.html'
                }
            },
            dev: {
                files: {
                    'build/app/public/index.html': 'src/public/index.html'
                }
            }
        },

        csslint: {
            strict: {
                options: {
                    import: 2
                },
                src: ['src/public/css/app.css']
            },
            lax: {
                options: {
                    import: false
                },
                src: ['src/public/css/app.css']
            }
        },

        jsdoc : {
            dist : {
                src: ['src/*.js', 'test/*.js'],
                options: {
                    destination: 'doc'
                }
            }
        },

        jsonlint: {
            dev: {
                src: [ 'src/**/*.json' ]
            }
        },

        complexity: {
            generic: {
                src: ['src/**/*.js'],
                exclude: ['test*.js'],
                options: {
                    breakOnErrors: true,
                    jsLintXML: 'report.xml',
                    checkstyleXML: 'checkstyle.xml',
                    errorsOnly: false,
                    cyclomatic: [3, 7, 12],
                    halstead: [8, 13, 20],
                    maintainability: 100,
                    hideComplexFunctions: false,
                    broadcast: false
                }
            }
        },

        jslint: {
            server: {
                src: [
                    'src/*.js',
                    'src/routes/*.js',
                    'src/dao/*.js',
                    'src/auth/*.js'
                ],
                directives: {
                    node: true,
                    todo: true
                },
                options: {
                    edition: 'latest',
                    log: 'build/jslint/server-lint.log',
                    jslintXml: 'build/jslint/server-jslint.xml',
                    errorsOnly: true,
                    failOnError: true,
                    checkstyle: 'build/jslint/server-checkstyle.xml'
                }
            },
            client: {
                src: [
                    'src/public/js/**/*.js'
                ],
                directives: {
                    browser: true,
                    todo: true
                },
                options: {
                    edition: 'latest',
                    log: 'build/jslint/client-lint.log',
                    jslintXml: 'build/jslint/client-jslint.xml',
                    errorsOnly: true,
                    failOnError: true,
                    checkstyle: 'build/jslint/client-checkstyle.xml'
                }
            }
        }
    });

    // Define task(s).
    // Check
    grunt.registerTask('check:css', [
        'newer:csslint:strict'
    ]);
    grunt.registerTask('check:client', [
        'newer:jshint:client',
        'newer:jslint:client'
    ]);
    grunt.registerTask('check:server', [
        'newer:jshint:server',
        'newer:jslint:server'
    ]);
    grunt.registerTask('check', [
        'check:css',
        'check:server',
        'check:client'
    ]);

    grunt.registerTask('test', [
        'env:coverage',
        'instrument',
        'mochaTest',
        'storeCoverage',
        'makeReport'//,
        //'coverage'
    ]);

    // Builds
    grunt.registerTask('build:server', [
        'check:server',
        'newer:copy:server'
    ]);
    grunt.registerTask('build:client', [
        'check:client',
        'newer:concat:client',
        'newer:uglify:client',
        'newer:htmlmin:dev',
        'newer:cssmin',
        'newer:copy:client'
    ]);

    // Tasks
    grunt.registerTask('build', [
        'clean',
        'check',
        'test',
        'build:server',
        'build:client',
        'newer:copy:node'
    ]);

    //grunt.registerTask('test', ['karma']);
    //grunt.registerTask('docs', ['jsdoc']);
    //grunt.registerTask('clean', ['clean']);
    grunt.registerTask('report', ['newer:complexity:generic']);

    // Defualt Task
    grunt.registerTask('default', ['check']);
};
