<div class="mb"></div>

<div class="btn_black small"
    ng-click="back()">
    <i class="icon-left-big"> </i>Back
</div>

<div class="title">
    <span ng-show="isGymAccount()">Manage Your Walls</span>
    <span ng-hide="isGymAccount()">Walls</span>
</div>

<div ng-repeat="wall in walls">
    <div class="wall"
        ng-click="navigateToWall(gymId, wall.id)">
        {{wall.name}} <i class="icon-right-big"> </i>
    </div>
</div>

<div ng-show="isGymAccount()">
    <div>
        <input ng-model="form.wallName"
                placeholder="Wall Name"
                autocorrect="off"
                autocapitalize="off"></input>
    </div>

    <div class="mb"></div>
        <div class="btn_black" ng-click="addClicked()">
            <i class="icon-plus-squared"> </i> Add
        </div>
    </div>
</div>
