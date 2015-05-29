angular.module('SETTER')
    .directive('ssUploadImage', [
        function (
        ) {
            'use strict';

            return {

              restrict: 'E',
              replace: true,
              scope: {
                action: '@',
                authorization: '@',
                image: '@',
                callback: '=',
                active: '='
              },
              templateUrl: 'templates/directives/ssUploadImage.tpl.html',
              link: function(scope, element, attrs) {
                if (!scope.image || !scope.image || scope.image === '') {
                    scope.image = 'images/no_image.png';
                }

                scope.isUploadingImage = false;

                scope.fileNameChanged = function () {
                  scope.isUploadingImage = true;
                  element.find(".submit").trigger('click');
                };

                scope.imageUploadComplete = function (content) {
                  scope.isUploadingImage = false;
                  scope.image = content.url;
                  scope.callback(content);
                };
              }

            };
        }]);
