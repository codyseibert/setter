<div class="st--header mb2">
    <section class="row">
        <div class="small-12 columns header">
            <div class="left" ng-show="isGymAccount()">
                <button class="[ btn--secondary btn--small  right ] icon-left-big"
                    ng-click="back()" >
                    Back
                </button>
            </div>
        </div>

        <div class="small-12 columns">
            <h1 class="icon-th-large"> Route Archive</h1>
        </div>
    </section>
</div>

<section class="row">
    <div class="small-12 columns">
        <label class="fwb">Type</label>
        <select ng-model="form.view"
                class="[ select--medium select--secondary ]"
                ng-options="view.value for view in views"
                ng-change="refreshView()"></select>
    </div>
</section>

<section class="row">
    <div class="small-6 columns">
        <!-- Zone filter dropdown -->
        <label class="fwb">Zone</label>
        <select ng-model="form.zoneFilter"
                class="[ select--medium select--secondary ]"
                ng-options="zone.value for zone in zoneInputs"
                ng-change="refreshFilters()"></select>
    </div>

    <div class="small-6 columns">
        <!-- Color filter dropdown -->
        <label class="fwb">Color</label>
        <select ng-model="form.colorFilter"
                class="[ select--medium select--secondary ]"
                ng-options="color.value for color in colorInputs"
                ng-style="{color: input.extra}"
                ng-change="refreshFilters()"></select>
    </div>

    <div class="small-6 columns">
        <!-- V Grade filter dropdown -->
        <label class="fwb">Grade</label>
        <select ng-model="form.boulderGradeFilter"
                class="[ select--medium select--secondary ]"
                ng-show="form.view.value === BOULDERING_VIEW"
                ng-options="grade.value for grade in boulderGradeInputs"
                ng-change="refreshFilters()"></select>

        <!-- YDS Grade filter dropdown -->
        <select ng-model="form.ropeGradeFilter"
                class="[ select--medium select--secondary ]"
                ng-show="form.view.value === ROPE_VIEW"
                ng-options="grade.value for grade in ropeGradeInputs"
                ng-change="refreshFilters()"></select>
    </div>

    <div class="small-6 columns">
        <!-- Setter Grade filter dropdown -->
        <label class="fwb">Setter</label>
        <select ng-model="form.setterFilter"
                class="[ select--medium select--secondary ]"
                ng-options="setter.value for setter in setterInputs"
                ng-change="refreshFilters()"></select>
    </div>
</section>

<section class="row">
    <div ng-style="{'width': filter.width}"
            ng-repeat="filter in filters"
            ng-hide="(form.view.value === ROPE_VIEW && filter.name === 'V') || (form.view.value === BOULDERING_VIEW && filter.name === 'YDS')"
            class="columns {{filter.class}}"
            style="display: inline-block; vertical-align: top;">
        {{filter.name}}
        <br>
        <i ng-show="isFilterableColumn(filter)" ng-click="showFilterPanel(filter)" class="icon-glass" ng-style="getFilterIconStyle(filter)">F</i>
        <i ng-click="sortIconClicked(filter)" ng-class="{'icon-minus': filter.sort === 0, 'icon-down-open': filter.sort === 1, 'icon-up-open': filter.sort === 2}">
            <span ng-show="filter.sort === 1">V</span>
            <span ng-show="filter.sort === 2">^</span>
        </i>
    </div>

    <div class="small-1 columns"> </div>
</section>

<section ng-repeat="route in routes"
         class="row list--tableStyle  list--navElem"
         ng-show="route.show"
         ng-click="navigateToRoute(route.gym_id, route.wall_id, route.id)">

    <div class="small-1 columns">{{route.wall_name}}</div>
    <div class="small-1 columns"><i class="icon-circle" ng-style="{color: route.value}"> </i></div>
    <div class="small-1 columns"
         ng-show="form.view.value === BOULDERING_VIEW">
        {{route.boulder_grade || '-'}}
    </div>
    <div class="small-1 columns"
         ng-show="form.view.value === ROPE_VIEW">
        {{route.rope_grade || '-'}}
    </div>
    <div class="small-1 columns">{{route.route_name || '-'}}</div>
    <div class="small-2 columns">{{route.setter}}</div>
    <div class="small-2 columns">
        <span style="font-size: 8px;" class="rated display--inlineBlock"
            ng-repeat="star in stars">
            <i ng-class="{'icon-star': isFilled(star, route.rating), 'icon-star-empty': !isFilled(star, route.rating)}"
            class="rating  mb0  right"> </i>
        </span>
    </div>
    <div class="small-1 columns">{{route.sends}}</div>
    <div class="small-2 columns">{{route.date_format}}</div>
    <div class="small-1 columns"><i ng-show="!route.active" class="icon-down-big"> </i></div>
</section>
