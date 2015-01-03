/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, confirm: false, moment: false */

angular.module('SETTER')
    .controller('BlogController', [
        '$scope',
        '$sce',
        'BlogService',
        'DateFormatService',
        function BlogController(
            $scope,
            $sce,
            BlogService,
            DateFormatService
        ) {

            'use strict';

            BlogService.getPosts()
                .success(function (pData) {
                    var i,
                        post;

                    for (i = 0; i < pData.length; i += 1) {
                        post = pData[i];
                        post.original_html = post.html;
                        post.edit_html = post.original_html;
                        post.html = $sce.trustAsHtml(post.html);
                        post.date = DateFormatService.format(post.date);
                    }
                    $scope.posts = pData;
                });

            $scope.isAdmin = function () {
                return $scope.getAccountId() === 1;
            };

            $scope.edit = function (pPost) {
                pPost.isEditMode = true;
                pPost.edit_html = pPost.original_html;
            };

            $scope.save = function (pPost) {
                pPost.isEditMode = false;
                pPost.original_html = pPost.edit_html;
                pPost.html = $sce.trustAsHtml(pPost.edit_html);

                BlogService.updatePost(pPost.id, pPost.edit_html)
                    .success(function () {
                        angular.noop();
                    });
            };

            $scope.cancel = function (pPost) {
                pPost.isEditMode = false;
            };

            $scope.post = function () {
                BlogService.createPost($scope.new_html)
                    .success(function (pData) {
                        var post = {
                            id: pData.id,
                            html: $sce.trustAsHtml($scope.new_html),
                            date: DateFormatService.format(moment())
                        };
                        $scope.posts.unshift(post);
                        $scope.new_html = "";
                    });
            };
        }]);
