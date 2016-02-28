###jslint nomen: true ###

###
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
###

require './Routes'
require('./App').listen process.env.SETTER_PORT or 5000
console.log 'Server Started!'
