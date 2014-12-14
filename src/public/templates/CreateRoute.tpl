<div ng-hide="hasSetters()">
    This gym has not added any setters!

    Click here to do so!
</div>

<div ng-show="hasSetters()">
    <input ng-model="form.name"
            placeholder="route name"/>
    <br>
    <select ng-model="form.boulderGrade"
                ng-options="grade.name for grade in boulderGrades"></select>
    <br>
    <select ng-model="form.ropeGrade"
                ng-options="grade.name for grade in ropeGrades"></select>
    <br>
    <select ng-model="form.color"
                ng-options="color.name for color in colors"
                ng-style="{color: color.value}"></select>
    <br>
    <select ng-model="form.setter"
                ng-options="setter.name for setter in setters"></select>
    <br>
    <input ng-model="form.note"
            placeholder="note">
    <br>
    <div class="btn_black"
            ng-click="addClicked()">
        <i class="icon-plus-squared"> </i> Add Route
    </div>
</div>
