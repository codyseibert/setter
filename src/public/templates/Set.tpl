<div class="title">SET.tpl {{set.date}}</div>

<div ng-repeat="route in routes">
    <div class="route"
        ng-click="navigateToRoute(route.id)">
        {{route.id}} {{route.date}}
    </div>
</div>

<div ng-show="isGymAccount()">
    <div class="btn_black" ng-click="navigateToCreateRoute(gymId, wallId, setId)">
        <i class="icon-plus-squared"> </i> Add Route
    </div>
</div>
