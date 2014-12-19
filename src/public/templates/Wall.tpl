<section class="header row small-collapse">

    <div class="left mt1">
        <button class="[ btn--secondary btn--medium right ] icon-left-big"
                    ng-click="navigateToWalls(gymId)" >
            <span ng-show="isGymAccount()">Manage</span> Zones
        </button>
    </div>

    <div class="small-12 columns">
        <div class="media--fl" ng-show="isEditMode">

            <input ng-model="form.name" type="text">
            </input>

            <button class="btn--medium  btn--primary " ng-click="save()">
                Save
            </button>
        </div>

        <h1 ng-hide="isEditMode" class="title">
            {{wall.name}}
            <a class="icon-pencil" ng-click="edit()" ng-hide="isUserAccount() || isEditMode"></a>
        </h1>
    </div>
</section>

<div ng-show="isGymAccount()" class="row" data-ui-component="routeActions">
    <div class="small-12 columns mb2">
        <button class="btn--medium btn--primary icon-plus-squared btn--expanded"
            ng-click="navigateToCreateRoute(gymId, wallId)">
            Add Route
        </button>
    </div>
</div>

<ul class="list--tableStyle">
    <li ng-repeat="route in routes" class="list--tableStyle  ptb2">
        <a ng-click="navigateToRoute(gymId, wallId, route.id)">
            <i class="icon-circle"
            ng-style="{color: route.value}"> </i>
            {{route.route_name}} {{route.boulder_grade || route.rope_grade}}<i class="icon-right-big"> </i>
        </a>
    </li>
</ul>

<section class="row">
    <div class="small-12 columns  text-center"
        ng-show="isGymAccount()"
        data-ui-component="routeSubActions">
        <a class="icon-trash"
            ng-click="delete()">
            Delete Wall
        </a>
    </div>
</section>
