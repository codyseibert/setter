<section class="header">
    <h1 class="title">Route Manager</h1>
</section>

<div style="text-align: center;">
    <div ng-show="isFilterPanelVisible" style="margin-bottom: 20px;">
        {{filter.name}} Filter

        <div ng-show="filter.key === 'wall_name'">
            <button ng-click="selectAll(zoneInputs)">Select All</button>
            <button ng-click="unselectAll(zoneInputs)">Unselect All</button>
            <br>
            <div ng-repeat="input in zoneInputs" style="padding: 10px; display: inline-block; vertical-align: top; cursor: pointer;">
                <div style="display: inline-block; width: 100px; padding: 10px; height 30px; border-radius: 10px; border: 1px solid black;"
                        ng-style="getFilterStyle(input)"
                        ng-click="filterClicked(input)">
                    {{input.value}}
                </div>
            </div>
        </div>

        <div ng-show="filter.key === 'color'">
            <button ng-click="selectAll(colorInputs)">Select All</button>
            <button ng-click="unselectAll(colorInputs)">Unselect All</button>
            <br>
            <div ng-repeat="input in colorInputs" style="padding: 10px; display: inline-block; vertical-align: top; cursor: pointer;">
                <div style="display: inline-block; width: 100px; padding: 10px; height 30px; border-radius: 10px; border: 1px solid black;"
                        ng-style="getFilterStyle(input)"
                        ng-click="filterClicked(input)">
                    <i class="icon-circle" ng-style="{color: input.extra}"> </i> {{input.value}}
                </div>
            </div>
        </div>

        <div ng-show="filter.key === 'boulder_grade_id'">
            <button ng-click="selectAll(boulderGradeInputs)">Select All</button>
            <button ng-click="unselectAll(boulderGradeInputs)">Unselect All</button>
            <br>
            <div ng-show="input.value" ng-repeat="input in boulderGradeInputs" style="padding: 10px; display: inline-block; vertical-align: top; cursor: pointer;">
                <div style="display: inline-block; width: 100px; padding: 10px; height 30px; border-radius: 10px; border: 1px solid black;"
                        ng-style="getFilterStyle(input)"
                        ng-click="filterClicked(input)">
                    {{input.value}}
                </div>
            </div>
        </div>

        <div ng-show="filter.key === 'rope_grade_id'">
            <button ng-click="selectAll(ropeGradeInputs)">Select All</button>
            <button ng-click="unselectAll(ropeGradeInputs)">Unselect All</button>
            <br>
            <div ng-show="input.value" ng-repeat="input in ropeGradeInputs" style="padding: 10px; display: inline-block; vertical-align: top; cursor: pointer;">
                <div style="display: inline-block; width: 100px; padding: 10px; height 30px; border-radius: 10px; border: 1px solid black;"
                        ng-style="getFilterStyle(input)"
                        ng-click="filterClicked(input)">
                    {{input.value}}
                </div>
            </div>
        </div>

        <div ng-show="filter.key === 'setter'">
            <button ng-click="selectAll(setterInputs)">Select All</button>
            <button ng-click="unselectAll(setterInputs)">Unselect All</button>
            <br>
            <div ng-show="input.value" ng-repeat="input in setterInputs" style="padding: 10px; display: inline-block; vertical-align: top; cursor: pointer;">
                <div style="display: inline-block; width: 100px; padding: 10px; height 30px; border-radius: 10px; border: 1px solid black;"
                        ng-style="getFilterStyle(input)"
                        ng-click="filterClicked(input)">
                    {{input.value}}
                </div>
            </div>
        </div>
    </div>

    <div style="margin-bottom: 20px">
        <div ng-style="{'width': filter.width}" ng-repeat="filter in filters" style="display: inline-block; vertical-align: top;">
            {{filter.name}}
            <br>
            <i ng-show="isFilterableColumn(filter)" ng-click="showFilterPanel(filter)" class="icon-glass" ng-style="getFilterIconStyle(filter)"> </i>
            <i ng-click="sort(filter)" ng-class="{'icon-minus': filter.sort === 0, 'icon-down-open': filter.sort === 1, 'icon-up-open': filter.sort === 2}"> </i>
        </div>
    </div>

    <div ng-repeat="route in routes" style="margin-bottom: 10px;" ng-show="route.show">
        <div style="width: 120px; display: inline-block">{{route.wall_name}}</div>
        <div style="width: 70px; display: inline-block"><i class="icon-circle" ng-style="{color: route.value}"> </i></div>
        <div style="width: 80px; display: inline-block">{{route.boulder_grade}}</div>
        <div style="width: 80px; display: inline-block">{{route.rope_grade}}</div>
        <div style="width: 100px; display: inline-block">{{route.route_name}}</div>
        <div style="width: 100px; display: inline-block">{{route.setter}}</div>
        <div style="width: 80px; display: inline-block">{{route.rating}}</div>
        <div style="width: 80px; display: inline-block">{{route.sends}}</div>
        <div style="width: 150px; display: inline-block">{{route.date_format}}</div>
    </div>
</div>
