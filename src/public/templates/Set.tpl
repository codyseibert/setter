<div class="title">{{set.date}}</div>

<div ng-repeat="route in routes">
    <div class="route"
        ng-click="navigateToRoute(route.id)">
        {{route.id}} {{route.date}}
    </div>
</div>

<div ng-show="isGymAccount()">
    <div class="btn_black" ng-click="addClicked()">
        <i class="icon-plus-squared"> </i> Add Set
    </div>
</div>
