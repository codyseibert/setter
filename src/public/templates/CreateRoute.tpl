<section class="row small-collapse">

    <div class="header">
        <div class="display--block cf">
            <button ng-hide="isEditMode"
                class="[ btn--secondary btn--medium left  ] icon-left-big  display--block "
                ng-click="navigateToWall(gymId, wallId)" >
                Back
            </button>

            <button ng-show="isEditMode"
                class="[ btn--secondary btn--medium left  ] icon-left-big  display--block"
                ng-click="navigateToRoute(gymId, wallId, routeId)" >
                Back
            </button>
        </div>

        <h1 ng-hide="isEditMode" class="icon-pencil" >
            Add Route
        </h1>

        <h1 ng-show="isEditMode" class=" icon-pencil">
            Edit Route
        </h1>

    </div>

</section>


<section class="row" ng-show="hasSetters()" data-ui-component="route-editInformation">

    <div class="small-12 columns">

        <div class="fieldwrapper">

            <div class="flag  mb1">
                <h3 class="flag-image">Grade</h3>

               <div class="flag-body">

                <label class="[ select--medium select--secondary ] right">
                      <select name="grade" id="routeGrade" ng-model="form.boulderGrade"
                         ng-options="grade.name for grade in boulderGrades">
                    </select>
                </label>
                <label class="[ select--medium select--secondary ] right">
                   <select name="ropeGrades" id="routeGrade" ng-model="form.ropeGrade"
                               ng-options="grade.name for grade in ropeGrades">
                   </select>
                </label>


               </div>

            </div>


            <div class="flag  mb1">

                <h3 class="flag-image">Setter</h3>

               <div class="flag-body">
                    <label class="[ select--medium select--secondary ] right">
                       <select name="ropeGrades" id="routeGrade" ng-model="form.setter"
                                   ng-options="setter.name for setter in setters">
                        </select>
                    </label>
               </div>

            </div>


            <div class="flag  mb2">
                <h3 class="flag-image">Color</h3>

               <div class="flag-body">

                    <label class="[ select--medium select--secondary ] right">
                       <select name="ropeGrades" id="routeGrade" ng-model="form.color"
                               ng-style="{color: text_color}"
                               ng-change="colorChanged()">
                            <option value="{{color.id}}"
                                        ng-style="{color: color.value}"
                                        ng-repeat="color in colors">
                                {{color.name}}
                            </option>
                        </select>
                    </label>
               </div>

            </div>
            <h3>Route Name</h3>
            <input type="text" ng-model="form.name"
                placeholder="Enter name if applicable"/>

            <input type="text"  ng-model="form.note"
                placeholder="note">

            <button class="btn--primary  btn--medium  btn--expanded  icon-plus-squared"
                ng-click="addClicked()"
                ng-hide="isEditMode">
                Add Route
            </button>

            <button class="btn--primary  btn--medium  btn--expanded  icon-plus-squared"
                ng-click="saveClicked()"
                ng-show="isEditMode">
                Save Changes
            </button>

        </div>
    </div>

</section>

<section class="row" ng-hide="hasSetters()">
    This gym has no setters!
    <div class="small-12 columns">
        <button class="btn--primary btn--medium btn--expanded  icon-plus-squared" ng-click="navigateToSetters()"
            ng-hide="isEditMode">
        Manage Setters
        </button>
    </div>
</section>
