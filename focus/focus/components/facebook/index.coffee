module.exports = [
  '$rootScope'
  (
    $rootScope
  ) ->

    restrict: 'E'

    link: (scope, elem, attr) ->

      # $timeout(function(){
      #     if ($(".fb-page iframe").length === 0) {
      #         FB.XFBML.parse();
      #     }
      # }, 500)

    templateUrl: 'components/facebook/template.html'

]
