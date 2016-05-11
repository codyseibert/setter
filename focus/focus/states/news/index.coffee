module.exports =

  state: 'gyms.news'

  url: '/:gymId/news'

  layout: '2-col'

  view: 'content'

  components:
    cols:
      left: 6
      right: 6
    left: 'configurations'
    right: 'settings'
