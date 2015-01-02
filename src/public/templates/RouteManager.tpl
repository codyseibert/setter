<section class="row">

    <div class="small-12 columns header">
        <div class="left" ng-show="isGymAccount()">
            <button class="[ btn--secondary btn--medium right ] icon-left-big"
                ng-click="back()" >
                Back
            </button>
        </div>
    </div>

    <div class="small-12 columns">
        <h1 class="icon-th-large"> Route Manager</h1>
    </div>

</section>

<div class="row">
    <div class="small-12  columns  ">

                <h2>Grade Range</h2>
             <input type="range">
            
        <div ng-show="isFilterPanelVisible" style="margin-bottom: 20px;">
            {{filter.name}} Filter

            <div ng-show="filter.key === 'wall_name'">

                <button class="btn--secondary  btn--tiny" ng-click="selectAll(zoneInputs)">Select All</button>
               
                <button class="btn--secondary  btn--tiny" ng-click="unselectAll(zoneInputs)">Unselect All</button>

                <div  ng-repeat="input in zoneInputs" style="padding: 10px; display: inline-block; vertical-align: top; cursor: pointer;">
                    <div class="btn--tiny  btn--tetriary" 
                            ng-class="active: selected"
                            ng-click="filterClicked(input)">
                        {{input.value}}
                    </div>

                </div>

            </div>

        </div>

    </div>

</div>


<section class="row  small-collapse">
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
                <div ng-repeat="input in boulderGradeInputs" style="padding: 10px; display: inline-block; vertical-align: top; cursor: pointer;">
                    <div style="display: inline-block; width: 100px; padding: 10px; height 30px; border-radius: 10px; border: 1px solid black;"
                            ng-style="getFilterStyle(input)"
                            ng-click="filterClicked(input)">
                        {{input.value || 'unrated'}}
                    </div>
                </div>
            </div>

            <div ng-show="filter.key === 'rope_grade_id'">
                <button ng-click="selectAll(ropeGradeInputs)">Select All</button>
                <button ng-click="unselectAll(ropeGradeInputs)">Unselect All</button>
                <br>
                <div ng-repeat="input in ropeGradeInputs" style="padding: 10px; display: inline-block; vertical-align: top; cursor: pointer;">
                    <div style="display: inline-block; width: 100px; padding: 10px; height 30px; border-radius: 10px; border: 1px solid black;"
                            ng-style="getFilterStyle(input)"
                            ng-click="filterClicked(input)">
                        {{input.value || 'unrated'}}
                    </div>
                </div>
            </div>

            <div ng-show="filter.key === 'setter'">
                <button ng-click="selectAll(setterInputs)">Select All</button>
                <button ng-click="unselectAll(setterInputs)">Unselect All</button>
                <br>
                <div ng-repeat="input in setterInputs" style="padding: 10px; display: inline-block; vertical-align: top; cursor: pointer;">
                    <div style="display: inline-block; width: 100px; padding: 10px; height 30px; border-radius: 10px; border: 1px solid black;"
                            ng-style="getFilterStyle(input)"
                            ng-click="filterClicked(input)">
                        {{input.value}}
                    </div>
                </div>
            </div>



            <div ng-show="filter.key === 'active'">
                <button ng-click="selectAll(activeInputs)">Select All</button>
                <button ng-click="unselectAll(activeInputs)">Unselect All</button>
                <br>
                <div ng-repeat="input in activeInputs" style="padding: 10px; display: inline-block; vertical-align: top; cursor: pointer;">
                    <div style="display: inline-block; width: 100px; padding: 10px; height 30px; border-radius: 10px; border: 1px solid black;"
                            ng-style="getFilterStyle(input)"
                            ng-click="filterClicked(input)">
                        <span ng-show="input.value === 1">Active</span>
                        <span ng-show="input.value === 0">Inactive</span>
                    </div>
                </div>
            </div>
        </div>
        
        <ul class="list--tableStyle  list  list--stats">
            


            <li class="title  fwb">

                <div ng-style="{'width': filter.width}" ng-repeat="filter in filters" style="display: inline-block; vertical-align: top;">
                    {{filter.name}}

                    <i ng-show="isFilterableColumn(filter)" ng-click="showFilterPanel(filter)" class="icon-glass" ng-style="getFilterIconStyle(filter)"> </i>

                    <i ng-click="sort(filter)" ng-class="{'icon-minus': filter.sort === 0, 'icon-down-open': filter.sort === 1, 'icon-up-open': filter.sort === 2}"> </i>
                </div>
            </li>

            <li class="list-elem  route" ng-repeat="route in routes" ng-style="getRouteStyle(route)" ng-show="route.show">
                <span class="route-mainInfo">{{route.wall_name}}</span>
                <span class="route-mainInfo"><i class="icon-circle" ng-style="{color: route.value}"> </i></span>
                <span class="route-mainInfo">{{route.boulder_grade}}</span>
                <span class="route-mainInfo">{{route.rope_grade}}</span>
                <span class="route-mainInfo">{{route.route_name}}</span>
                <span class="route-mainInfo">{{route.setter}}</span>
                <span class="route-mainInfo">{{route.rating}}</span>
                <span class="route-mainInfo">{{route.sends}}</span>
                <span class="route-mainInfo">{{route.date_format}}</span>

                <div style="width: 50px; display: inline-block">
                    <i ng-show="!route.active" class="icon-down-big"> </i>
                </div>
            </li>

        </ul>

    </div>

   

</section>
