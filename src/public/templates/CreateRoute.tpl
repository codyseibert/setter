<section class="header row small-collapse">
    <div class="left mt1">
        <button ng-hide="isEditMode"
            class="[ btn--secondary btn--medium right ] icon-left-big"
            ng-click="navigateToWall(gymId, wallId)" >
            Back
        </button>
        <button ng-show="isEditMode"
            class="[ btn--secondary btn--medium right ] icon-left-big"
            ng-click="navigateToRoute(gymId, wallId, routeId)" >
            Back
        </button>
    </div>

    <div class="small-12 columns">
        <h1 ng-hide="isEditMode" class="title">
            Create Route
        </h1>
        <h1 ng-show="isEditMode" class="title">
            Edit Route
        </h1>
    </div>
</section>


<div ng-hide="hasSetters()">
    This gym has no setters!

    <div class="btn_black"
            ng-click="navigateToSetters()"
            ng-hide="isEditMode">
        <i class="icon-plus-squared"> </i> Manage Setters
    </div>
</div>

<div ng-show="hasSetters()">
    <input ng-model="form.name"
            placeholder="route name"/>
    <br>
    <input ng-model="form.note"
        placeholder="note">
    <br>
    <select ng-model="form.boulderGrade"
                ng-options="grade.name for grade in boulderGrades"></select>
    <select ng-model="form.ropeGrade"
                ng-options="grade.name for grade in ropeGrades"></select>
    <br>

    <select ng-model="form.setter"
                ng-options="setter.name for setter in setters"></select>
    <div class="add_setter"
            ng-click="navigateToSetters()">
        <i class="icon-plus-squared"> </i>
    </div>
    <br>

    <select ng-model="form.color"
                ng-style="{color: text_color}"
                ng-change="colorChanged()">
        <option value="{{color.id}}"
                    ng-style="{color: color.value}"
                    ng-repeat="color in colors">
            {{color.name}}
        </option>
    </select>
    <br>

    <div class="btn_black"
            ng-click="addClicked()"
            ng-hide="isEditMode">
        <i class="icon-plus-squared"> </i> Add Route
    </div>

    <div class="btn_black"
            ng-click="saveClicked()"
            ng-show="isEditMode">
        <i class="icon-plus-squared"> </i> Save
    </div>
</div>
