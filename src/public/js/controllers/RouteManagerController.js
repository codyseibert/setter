/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, moment: false, confirm: false */

/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, moment: false, confirm: false */

angular.module('SETTER')
    .controller('RouteManagerController', [
        '$scope',
        '$routeParams',
        'RoutesService',
        'DateFormatService',
        'LoginService',
        function (
            $scope,
            $routeParams,
            RoutesService,
            DateFormatService,
            LoginService
        ) {
            'use strict';

            if (!LoginService.validateLoggedIn()) {
                return;
            }

            $scope.gymId = $routeParams.gymId;

            $scope.routes = [];
            $scope.filter = null;
            $scope.isFilterPanelVisible = true;
            $scope.options = {};
            $scope.filters = [];
            $scope.form = {};

            $scope.stars = [];

            $scope.finishedRendering = false;

            $scope.$on('ngRepeatFinished', function (ngRepeatFinishedEvent) {
                $scope.finishedRendering = true;
            });

            var i,
                addFilter,
                getUniqueSet,
                sortByValue,
                sortByExtra;

            (function createStars() {
                for (i = 0; i < 5; i += 1) {
                    $scope.stars.push({
                        rating: i + 0.5
                    });
                }
            }());

            $scope.BOULDERING_VIEW = 'Bouldering';
            $scope.ROPE_VIEW = 'Rope';
            $scope.views = [
                {
                    value: $scope.BOULDERING_VIEW
                },
                {
                    value: $scope.ROPE_VIEW
                }
            ];
            $scope.form.view = $scope.views[0];

            addFilter = function (pName, pKey) {
                $scope.filters.push({
                    name: pName,
                    key: pKey,
                    sort: 0
                });
            };
            addFilter('Zone', 'wall_name');
            addFilter('Color', 'color');
            addFilter('Grade', 'boulder_grade_id');
            addFilter('YDS', 'rope_grade_id');
            addFilter('Setter', 'setter');
            addFilter('Rating', 'rating');
            addFilter('Sends', 'sends');
            addFilter('Date Set', 'date_value');

            getUniqueSet = function (pData, pKey, pExtra) {
                var value,
                    set,
                    seen,
                    extra;

                set = [];
                seen = [];
                for (i = 0; i < pData.length; i += 1) {
                    value = pData[i][pKey];

                    if (value !== null) {
                        if (seen.indexOf(value) === -1) {
                            extra = null;
                            if (pExtra) {
                                extra = pData[i][pExtra];
                            }

                            set.push({
                                value: value,
                                key: pKey,
                                extra: extra
                            });
                            seen.push(value);
                        }
                    }
                }
                return set;
            };

            sortByValue = function (pArray) {
                pArray.sort(function (a, b) {
                    return a.value.localeCompare(b.value);
                });
            };

            sortByExtra = function (pArray) {
                pArray.sort(function (a, b) {
                    return a.extra - b.extra;
                });
            };

            RoutesService.getRoutesInGym($scope.gymId, function (pData) {
                var clone;

                pData.map(function (pEntry) {
                    pEntry.date_format = DateFormatService.format(pEntry.date);
                    pEntry.date_value = moment(pEntry.date).valueOf();
                    pEntrytoprope_grade_id = pEntry.toprope_grade_id || -1;
                    pEntry.boulder_grade_id = pEntry.boulder_grade_id || -1;
                    if (!pEntry.rating) {
                        pEntry.rating = -1;
                    } else {
                        pEntry.rating = parseInt(pEntry.rating, 10);
                    }
                    pEntry.show = true;
                    return pEntry;
                });

                $scope.zoneInputs = getUniqueSet(pData, 'wall_name');
                $scope.colorInputs = getUniqueSet(pData, 'color', 'value');
                $scope.boulderGradeInputs = getUniqueSet(pData, 'boulder_grade', 'boulder_grade_id');
                $scope.ropeGradeInputs = getUniqueSet(pData, 'rope_grade', 'rope_grade_id');
                $scope.setterInputs = getUniqueSet(pData, 'setter');

                // Zone Option - prepend 'any zone'
                sortByValue($scope.zoneInputs);
                clone = JSON.parse(JSON.stringify($scope.zoneInputs[0]));
                clone.value = "Any";
                $scope.zoneInputs.unshift(clone);

                // Color Option - prepend 'any color'
                sortByValue($scope.colorInputs);
                clone = JSON.parse(JSON.stringify($scope.colorInputs[0]));
                clone.value = "Any";
                $scope.colorInputs.unshift(clone);

                // Boulder Grade Option - prepend 'any grade'
                sortByExtra($scope.boulderGradeInputs);
                clone = JSON.parse(JSON.stringify($scope.boulderGradeInputs[0]));
                clone.value = "Any";
                $scope.boulderGradeInputs.unshift(clone);

                // Rope Grade Option - prepend 'any garde'
                sortByExtra($scope.ropeGradeInputs);
                clone = JSON.parse(JSON.stringify($scope.ropeGradeInputs[0]));
                clone.value = "Any";
                $scope.ropeGradeInputs.unshift(clone);

                // Setter Option - prepend 'any setter'
                sortByValue($scope.setterInputs);
                clone = JSON.parse(JSON.stringify($scope.setterInputs[0]));
                clone.value = "Any";
                $scope.setterInputs.unshift(clone);

                $scope.form.zoneFilter = $scope.zoneInputs[0];
                $scope.form.colorFilter = $scope.colorInputs[0];
                $scope.form.boulderGradeFilter = $scope.boulderGradeInputs[0];
                $scope.form.ropeGradeFilter = $scope.ropeGradeInputs[0];
                $scope.form.setterFilter = $scope.setterInputs[0];

                $scope.routes = pData;
            });

            $scope.sortIconClicked = function (pFilter) {
                $scope.filters.map(function (pEntry) {
                    if (pEntry !== pFilter) {
                        pEntry.sort = 0;
                    }
                    return pEntry;
                });

                pFilter.sort = (pFilter.sort + 1) % 3;
                var key = pFilter.key;
                $scope.routes.sort(function (a, b) {
                    if (pFilter.sort === 2) {
                        var temp = a;
                        a = b;
                        b = temp;
                    }

                    if (a[key].localeCompare) {
                        return a[key].localeCompare(b[key]);
                    }
                    return a[key] - b[key];
                });
            };

            function refreshFilter(pFilter) {
                var length,
                    key,
                    entry;

                if (pFilter.value.indexOf('Any') !== -1) {
                    return;
                }

                for (i = 0, length = $scope.routes.length; i < length; i += 1) {
                    key = pFilter.key;
                    entry = $scope.routes[i];
                    if (entry[key] !== pFilter.value) {
                        entry.show = false;
                    }
                }
            }

            function showAllRoutes() {
                var length;
                for (i = 0, length = $scope.routes.length; i < length; i += 1) {
                    $scope.routes[i].show = true;
                }
            }

            $scope.refreshFilters = function () {
                showAllRoutes();
                refreshFilter($scope.form.zoneFilter);
                refreshFilter($scope.form.colorFilter);

                if ($scope.form.view.value === $scope.BOULDERING_VIEW) {
                    refreshFilter($scope.form.boulderGradeFilter);
                }

                if ($scope.form.view.value === $scope.ROPE_VIEW) {
                    refreshFilter($scope.form.ropeGradeFilter);
                }

                refreshFilter($scope.form.setterFilter);
            };

            $scope.refreshView = function () {
                $scope.refreshFilters();
            };

            $scope.isFilled = function (pStar, pRating) {
                if (pStar.rating <= pRating) {
                    return true;
                }
                return false;
            };
        }]);
