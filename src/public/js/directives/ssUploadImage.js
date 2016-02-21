angular.module('SETTER')
    .directive('ssUploadImage', [
        function (
        ) {
            'use strict';

            return {

              restrict: 'E',
              replace: true,
              scope: {
                class: '@',
                clickableClass: '@',
                action: '@',
                authorization: '@',
                image: '@',
                callback: '=?',
                active: '='
              },
              templateUrl: 'templates/directives/ssUploadImage.tpl.html',
              link: function(scope, element, attrs) {

                if (scope.class === undefined) {
                  scope.class = 'avatar--big'
                }

                if (scope.clickableClass === undefined) {
                  scope.class = 'avatar avatar--big'
                }

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
                  if (scope.callback) {
                    scope.callback(content);
                  }
                };
              }

            };
        }]);
