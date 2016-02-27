angular.module('SETTER').directive 'ssRouteCategorySelector', [ ->
  {
    scope: 'activeCategory': '='
    replace: true
    restrict: 'E'
    templateUrl: 'templates/directives/ssRouteCategorySelector.tpl.html'
    controller: [
      '$scope'
      ($scope) ->
        $scope.activeCategory = {}

        @setActiveCategory = (pCategory) ->
          $scope.activeCategory = pCategory
          switch $scope.activeCategory
            when 'boulder'
              $scope.activeCategoryText = 'Bouldering'
            when 'toprope'
              $scope.activeCategoryText = 'Top Rope'
            when 'lead'
              $scope.activeCategoryText = 'Lead'
          return

        @getActiveCategory = (pCategory) ->
          $scope.activeCategory

        return
    ]
    link: (scope, element, attrs, ctrl) ->
      scope.categories = [
        'boulder'
        'toprope'
        'lead'
      ]
      ctrl.setActiveCategory scope.categories[0]
      return

  }
 ]
