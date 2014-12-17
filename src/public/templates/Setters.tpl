<div class="btn_black small"
    ng-click="back()">
    <i class="icon-left-big"> </i>Back
</div>

<div class="title">Your Setters</div>
<div ng-repeat="setter in setters" ng-hide="setter.hide">
    <div class="setter">
        {{setter.firstname}} {{setter.lastname}}
        <div class="add">
            <i class="icon-minus-squared" ng-click="removeSetterClicked(setter)"> </i>
        </div>
    </div>
</div>

<div class="title">Users</div>
<div ng-repeat="user in users" ng-hide="user.hide">
    <div class="setter">
        {{user.firstname}} {{user.lastname}}
        <div class="add">
            <i class="icon-plus-squared" ng-click="addSetterClicked(user)"> </i>
        </div>
    </div>
</div>
