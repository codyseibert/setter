/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('CommentsService', ['$http', function ($http) {
        'use strict';

        return {
            getCommentsAboutRoute: function (pRouteId) {
                return $http({
                    method: 'GET',
                    url: 'api/routes/' + pRouteId + '/comments'
                });
            },
            createComment: function (pRouteId, pMessage) {
                return $http({
                    method: 'POST',
                    url: 'api/routes/' + pRouteId + '/comments',
                    data: {
                        message: pMessage
                    }
                });
            },
            updateComment: function (pCommentId, pMessage) {
                return $http({
                    method: 'POST',
                    url: 'api/comments/' + pCommentId,
                    data: {
                        message: pMessage
                    }
                });
            },
            deleteComment: function (pCommentId) {
                return $http({
                    method: 'DELETE',
                    url: 'api/comments/' + pCommentId
                });
            }
        };
    }]);
