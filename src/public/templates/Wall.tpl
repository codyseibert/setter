<div class="mb"></div>

<div class="btn_black small"
    ng-click="back()">
    <i class="icon-left-big"> </i>Back
</div>

<div class="mb"></div>

<div ng-show="isGymAccount()">
    <div class="button orange"
            ng-click="save()"
            ng-show="isEditMode">
        <i class="icon-floppy"> </i>
    </div>
    <div class="button orange"
            ng-click="edit()"
            ng-hide="isEditMode">
        <i class="icon-pencil"> </i>
    </div>
    <div class="button orange"
            ng-click="delete()">
        <i class="icon-trash"> </i>
    </div>
</div>

<div ng-hide="isEditMode" class="title">{{wall.name}}</div>
<input ng-show="isEditMode" ng-model="form.name" class="edit"></input>

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
