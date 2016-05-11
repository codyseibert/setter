module.exports =

  state: 'gyms.zone'

  url: '/:gymId/zone/:zoneId'

  layout: '2-col'

  view: 'content'

  components:
    cols:
      left: 7
      right: 5
    left: 'zone'
    right: 'preview'
