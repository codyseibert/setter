<div class="mb"></div>

<div class="btn_black small"
    ng-click="back()">
    <i class="icon-left-big"> </i>Back
</div>

<div class="title">{{wall.name}}</div>

<div ng-repeat="set in sets">
    <div class="set"
            ng-click="navigateToSet(gymId, wallId, set.id)">
        {{set.date}} <i class="icon-right-big"> </i>
    </div>
</div>

<div ng-show="isGymAccount()">
    <div class="btn_black" ng-click="addClicked()">
        <i class="icon-plus-squared"> </i> Add Set
    </div>
</div>
