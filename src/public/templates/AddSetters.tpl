<div class="btn_black"
    ng-click="back()">
    <i class="icon-left-big"> </i>Back
</div>

<div class="title">Add Setters</div>

<div ng-repeat="setter in setters" ng-hide="setter.hide">
    <div class="setter">
        {{setter.firstname}} {{setter.lastname}}
        <div class="add">
            <i class="icon-plus-squared" ng-click="addSetterClicked(setter)"> </i>
        </div>
    </div>
</div>
