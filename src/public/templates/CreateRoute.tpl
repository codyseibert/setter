<input ng-model="form.name" />

<select ng-model="form.boulderGrade"
    ng-options="grade.name for grade in boulderGrades"></select>

<select ng-model="form.ropeGrade"
    ng-options="grade.name for grade in ropeGrades"></select>

<select ng-model="form.color"
    ng-options="color.name for color in colors"></select>

<select ng-model="form.setter"
    ng-options="setter.name for setter in setters"></select>

<input ng-model="form.note">
