angular.module('SETTER')
    .directive('ssExportBarGraph', [
        '$timeout',
        function (
          $timeout
        ) {
            'use strict';

            return {

              restrict: 'E',
              replace: true,
              scope: {
                title: "@",
                canvasId: "@",
                docName: "@"
              },
              templateUrl: 'templates/graphs/ssExportBarGraph.tpl.html',
              controller: function($scope) {
                $scope.export = function () {
                    var canvas,
                        image,
                        doc,
                        JsPDF = jsPDF;
                    canvas = $('#' + $scope.canvasId).get(0);
                    image = new Image();
                    image.src = canvas.toDataURL("image/png");
                    doc = new JsPDF();
                    doc.text(20, 20, $scope.title);
                    doc.addImage(image, 15, 40, 180, 160);
                    doc.save($scope.docName);
                };
              },
              link: function(scope, element, attrs) {

              }

            };
        }]);
