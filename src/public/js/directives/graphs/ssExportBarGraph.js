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

                  // Takes an SVG element as target
                  function svg_to_png_data(target) {
                    var ctx, mycanvas, svg_data, img, child;

                    var style = function (target) {
                      try {
                        var cssStyle = window.getComputedStyle(target);
                        if (cssStyle){
                          target.style.cssText = cssStyle.cssText;
                        }
                      } catch (err) {

                      }
                    }

                    var flattenCss = function (target) {
                      style(target);
                      for (var i = 0; i < target.childNodes.length; i++) {
                        child = target.childNodes[i];
                        flattenCss(child);
                      }
                    };
                    flattenCss(target);

                    // Construct an SVG image
                    svg_data = '<svg xmlns="http://www.w3.org/2000/svg" width="' + target.offsetWidth +
                               '" height="' + target.offsetHeight + '">' + target.innerHTML + '</svg>';
                    img = new Image();
                    img.src = "data:image/svg+xml," + encodeURIComponent(svg_data);

                    // Draw the SVG image to a canvas
                    mycanvas = document.createElement('canvas');
                    mycanvas.width = target.offsetWidth;
                    mycanvas.height = target.offsetHeight;
                    ctx = mycanvas.getContext("2d");
                    ctx.drawImage(img, 0, 0);

                    // Return the canvas's data
                    return mycanvas.toDataURL("image/png");
                  }

                  // Takes an SVG element as target
                  function svg_to_png_replace(target) {
                    var data, image;
                    data = svg_to_png_data(target);
                    image = new Image();
                    image.src = data;
                    var logo = new Image();
                    logo.src = 'images/setter_print_logo.png'
                    logo.addEventListener('load', function (){
                      var doc = new jsPDF('p', 'px', [600, 800]);
                      doc.setFontSize(32);
                      doc.text(150, 50, $scope.title);
                      doc.addImage(image, 'png', 15, 90, 500, 440);
                      doc.text(273, 705, 'Printed on');
                      doc.addImage(logo, 'png', 400, 660, 150, 70);
                      doc.save($scope.docName);
                    });
                  }

                  svg_to_png_replace($('#' + $scope.canvasId).find('.ct-chart > svg')[0]);

                };
              },
              link: function(scope, element, attrs) {

              }

            };
        }]);
