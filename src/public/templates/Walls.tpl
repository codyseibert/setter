<div class="btn_black"
    ng-click="back()">
    <i class="icon-left-big"> </i>Back
</div>

<div class="title">Manage Your Walls</div>

<div ng-repeat="wall in walls">
    <div class="wall"
        ng-click="navigateToWall(gymId, wall.id)">
        {{wall.id}} {{wall.name}}
    </div>
</div>

<div>
    <input ng-model="form.wallName"
            placeholder="Wall Name"
            autocorrect="off"
            autocapitalize="off"></input>
</div>

<div class="mb"></div>

<div ng-show="isGymAccount()">
    <div class="btn_black" ng-click="addClicked()">
        <i class="icon-plus-squared"> </i> Add
    </div>
</div>
