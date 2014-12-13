<div class="title">Manage Your Walls</div>

<div class="wall"
        ng-repeat="wall in walls"
        ng-click="navigateToWall(gymId, wall.id)">
    {{wall.id}} {{wall.name}}
</div>

<div>
    <input ng-model="form.name"
            placeholder="Wall Name"
            autocorrect="off"
            autocapitalize="off"></input>
</div>

<div class="mb"></div>

<div>
    <div class="btn_black" ng-click="addClicked()">
        <i class="icon-plus-squared"> </i> Add
    </div>
</div>
