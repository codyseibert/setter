/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, moment: false, confirm: false */

/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, moment: false, confirm: false */

angular.module('SETTER')
    .controller('RouteManagerController', [
        '$scope',
        'RoutesService',
        '$routeParams',
        'DateFormatService',
        function (
            $scope,
            RoutesService,
            $routeParams,
            DateFormatService
        ) {
            'use strict';

            $scope.gymId = $routeParams.gymId;

            $scope.routes = [];
            $scope.filter = null;
            $scope.isFilterPanelVisible = true;
            $scope.options = {};

            $scope.filters = [];
            var addFilter = function (pName, pKey, pWidth) {
                $scope.filters.push({
                    name: pName,
                    key: pKey,
                    sort: 0,
                    width: pWidth
                });
            };
            addFilter('Zone', 'wall_name', 120);
            addFilter('Color', 'color', 70);
            addFilter('V', 'boulder_grade_id', 80);
            addFilter('YDS', 'rope_grade_id', 80);
            addFilter('Name', 'route_name', 100);
            addFilter('Setter', 'setter', 100);
            addFilter('Rating', 'rating', 80);
            addFilter('Sends', 'sends', 80);
            addFilter('Date', 'date_value', 150);
            addFilter('Active', 'active', 50);

            var getUniqueSet = function (pData, pKey, pExtra) {
                var i,
                    key,
                    value,
                    set,
                    seen;

                set = [];
                seen = [];
                for (i = 0; i < pData.length; i++) {
                    value = pData[i][pKey];
                    if (seen.indexOf(value) === -1) {
                        var extra = null;
                        if (pExtra) {
                            extra = pData[i][pExtra];
                        }

                        set.push({
                            enabled: true,
                            value: value,
                            key: pKey,
                            extra: extra
                        });
                        seen.push(value);
                    }
                }
                return set;
            };

            var sortByValue = function (pArray) {
                pArray.sort(function (a, b) {
                    return a.value.localeCompare(b.value);
                })
            };

            var sortByExtra = function (pArray) {
                pArray.sort(function (a, b) {
                    return a.extra - b.extra;
                })
            };

            RoutesService.getRoutesInGym($scope.gymId)
                .success(function (pData) {
                    pData.map(function(pEntry) {
                        pEntry.date_format = DateFormatService.format(pEntry.date);
                        pEntry.date_value = moment(pEntry.date).valueOf();
                        pEntry.rope_grade_id = pEntry.rope_grade_id || -1;
                        pEntry.boulder_grade_id = pEntry.boulder_grade_id || -1;
                        pEntry.show = true;
                        return pEntry;
                    });

                    $scope.zoneInputs = getUniqueSet(pData, 'wall_name');
                    $scope.colorInputs = getUniqueSet(pData, 'color', 'value');
                    $scope.boulderGradeInputs = getUniqueSet(pData, 'boulder_grade', 'boulder_grade_id');
                    $scope.ropeGradeInputs = getUniqueSet(pData, 'rope_grade', 'rope_grade_id');
                    $scope.setterInputs = getUniqueSet(pData, 'setter');
                    $scope.activeInputs = getUniqueSet(pData, 'active');
                    
                    sortByValue($scope.zoneInputs);
                    sortByValue($scope.colorInputs);
                    sortByExtra($scope.boulderGradeInputs);
                    sortByExtra($scope.ropeGradeInputs);
                    sortByValue($scope.setterInputs);

                    $scope.routes = pData;
                });

            $scope.filterClicked = function (pFilter) {
                pFilter.enabled = !pFilter.enabled;
                $scope.routes.map(function (pEntry) {
                    var key = pFilter.key;
                    if (pEntry[key] === pFilter.value) {
                        pEntry.show = pFilter.enabled;
                    }
                    return pEntry;
                });
            };

            $scope.selectAll = function (pFilters) {
                var i;
                for (i = 0; i < pFilters.length; i++) {
                    var filter = pFilters[i];
                    if (!filter.enabled) {
                        $scope.filterClicked(filter);
                    }
                }
            };

            $scope.unselectAll = function (pFilters) {
                var i;
                for (i = 0; i < pFilters.length; i++) {
                    var filter = pFilters[i];
                    if (filter.enabled) {
                        $scope.filterClicked(filter);
                    }
                }
            };

            $scope.getFilterStyle = function (pFilter) {
                var border = '1px solid black';
                var bg = '#Fd7d66';
                if (!pFilter.enabled) {
                    border = '1px dotted black';
                    bg = '#EEE';
                }
                return {
                    'background-color': bg,
                    'border': border
                };
            };

            $scope.getFilterIconStyle = function (pFilter) {
                var color = '#Fd7d66';
                if (!pFilter.enabled) {
                    color = '#000';
                }
                return {
                    'color': color
                };
            }

            $scope.isFilterableColumn = function (pFilter) {
                var name = pFilter.name;

                return name === 'Zone' ||
                        name === 'Color' ||
                        name === 'V' ||
                        name === 'YDS' ||
                        name === 'Setter' ||
                        name === 'Active';
            };

            $scope.getRouteStyle = function (pRoute) {
                var bg = 'white';
                if (!pRoute.active) {
                    bg = '#DDD';
                }
                return {
                    'background-color': bg
                };
            }

            $scope.showFilterPanel = function (pFilter) {
                $scope.filters.map(function (pEntry) {
                    pEntry.enabled = false;
                    return pEntry;
                });
                pFilter.enabled = true;
                $scope.filter = pFilter;
            };

            $scope.sort = function (pFilter) {
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
                    } else {
                        return a[key] - b[key];
                    }
                });
            };

            $scope.showFilterPanel($scope.filters[0]);
        }]);
