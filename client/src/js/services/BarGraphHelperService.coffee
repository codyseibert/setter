###jslint nomen: true ###

###global angular: false ###

angular.module('SETTER').factory 'BarGraphHelperService', [
  'DateFormatService'
  (DateFormatService) ->
    'use strict'
    {
      labelParams: (pData, isRope) ->
        i = undefined
        labels = []
        dataArray = []
        i = 0
        while i < pData.length
          data = pData[i]
          if !data.grade
            i += 1
            continue
          dataArray.push data.count
          prefix = 'V'
          if isRope
            prefix = '5.'
          labels.push prefix + data.grade
          i += 1
        {
          labels: labels
          data: [ dataArray ]
        }
      preprocess2: (pData) ->
        i = undefined
        labels = []
        dataArray = []
        i = 0
        while i < pData.length
          data = pData[i]
          if !data.name
            i += 1
            continue
          dataArray.push data.count
          labels.push data.name
          i += 1
        {
          labels: labels
          datasets: [ {
            data: dataArray
            fillColor: 'rgba(174, 203, 131, 0.4)'
            strokeColor: '#A3BF7C'
          } ]
        }
      preprocess: (pData) ->
        i = undefined
        labels = []
        dataArray = []
        i = 0
        while i < pData.length
          data = pData[i]
          if !data.name
            i += 1
            continue
          dataArray.push data.count
          labels.push data.name
          i += 1
        {
          labels: labels
          series: [ dataArray ]
        }
      preprocessProgress: (pData, pType) ->
        `var i`
        i = undefined
        labels = []
        dataArray = []
        hasData = true
        if pData.length == 0
          hasData = false
          dataArray.push
            date: '2015-01-01T05:00:00.000Z'
            bouldering_grade: 0
            lead_grade: 6
            toprope_grade: 6
        i = 0
        while i < pData.length
          data = pData[i]
          dataArray.push data[pType]
          labels.push DateFormatService.formatMonth(data.date)
          i += 1
        i = dataArray.length - 1
        while i >= 1
          if dataArray[i] < dataArray[i - 1]
            dataArray[i - 1] = dataArray[i]
          i--
        {
          labels: labels
          series: [ dataArray ]
          hasData: hasData
        }

    }
]
