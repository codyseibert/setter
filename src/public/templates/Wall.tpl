<div class="title">{{wall.name}}</div>

<div ng-repeat="set in sets">
    <div class="set"
            ng-click="navigateToSet(set.id)">
        {{set.id}} {{set.date}}
    </div>
</div>

<div ng-show="isGymAccount()">
    <div class="btn_black" ng-click="addClicked()">
        <i class="icon-plus-squared"> </i> Add Set
    </div>
</div>
