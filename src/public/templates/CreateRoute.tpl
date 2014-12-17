<div class="btn_black small"
    ng-click="back()">
    <i class="icon-left-big"> </i>Back
</div>

<div class="mb"></div>

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
