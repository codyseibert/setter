/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, confirm: false, moment: false */

angular.module('SETTER')
    .factory('BlogService', function ($http) {
        'use strict';

        return {
            getPosts: function () {
                return $http({
                    method: 'GET',
                    url: 'api/blog/'
                });
            },
            updatePost: function (pBlogId, pHtml) {
                return $http({
                    method: 'POST',
                    url: 'api/blog/' + pBlogId,
                    data: {
                        html: pHtml
                    }
                });
            },
            createPost: function (pHtml) {
                return $http({
                    method: 'POST',
                    url: 'api/blog/',
                    data: {
                        html: pHtml
                    }
                });
            }
        };
    });
