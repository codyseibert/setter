###global angular: false, btoa: false, console: false, Chart: false, moment: false ###

###ignore jslint start###

angular.module('SETTER').factory 'NaturalSort', [ ->
  'use strict'
  (aa, bb) ->
    # Edited here to make sure it could sort the objects
    a = aa.value
    b = bb.value
    re = /(^([+\-]?(?:0|[1-9]\d*)(?:\.\d*)?(?:[eE][+\-]?\d+)?)?$|^0x[0-9a-f]+$|\d+)/gi
    sre = /(^[ ]*|[ ]*$)/g
    dre = /(^([\w ]+,?[\w ]+)?[\w ]+,?[\w ]+\d+:\d+(:\d+)?[\w ]?|^\d{1,4}[\/\-]\d{1,4}[\/\-]\d{1,4}|^\w+, \w+ \d+, \d{4})/
    hre = /^0x[0-9a-f]+$/i
    ore = /^0/

    i = (s) ->
      naturalSort.insensitive and ('' + s).toLowerCase() or '' + s

    x = i(a).replace(sre, '') or ''
    y = i(b).replace(sre, '') or ''
    xN = x.replace(re, '\u0$1\u0').replace(/\0$/, '').replace(/^\0/, '').split('\u0')
    yN = y.replace(re, '\u0$1\u0').replace(/\0$/, '').replace(/^\0/, '').split('\u0')
    xD = parseInt(x.match(hre), 16) or xN.length != 1 and x.match(dre) and Date.parse(x)
    yD = parseInt(y.match(hre), 16) or xD and y.match(dre) and Date.parse(y) or null
    oFxNcL = undefined
    oFyNcL = undefined
    # first try and sort Hex codes or Dates
    if yD
      if xD < yD
        return -1
      else if xD > yD
        return 1
    # natural sorting through split numeric strings and default strings
    cLoc = 0
    numS = Math.max(xN.length, yN.length)
    while cLoc < numS
      # find floats not starting with '0', string or 0 if not defined (Clint Priest)
      oFxNcL = !(xN[cLoc] or '').match(ore) and parseFloat(xN[cLoc]) or xN[cLoc] or 0
      oFyNcL = !(yN[cLoc] or '').match(ore) and parseFloat(yN[cLoc]) or yN[cLoc] or 0
      # handle numeric vs string comparison - number < string - (Kyle Adams)
      if isNaN(oFxNcL) != isNaN(oFyNcL)
        return if isNaN(oFxNcL) then 1 else -1
      else if typeof oFxNcL != typeof oFyNcL
        oFxNcL += ''
        oFyNcL += ''
      if oFxNcL < oFyNcL
        return -1
      if oFxNcL > oFyNcL
        return 1
      cLoc++
    0
 ]
