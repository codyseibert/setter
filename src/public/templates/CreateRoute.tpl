<section class="header row small-collapse">
    <div class="left">
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
        <h1 ng-hide="isEditMode" >
            Create Route
        </h1>
        <h1 ng-show="isEditMode" >
            Edit Route
        </h1>
    </div>
</section>


<section class="row" ng-show="hasSetters()">

    <div class="small-12 columns">

        <div class="fieldwrapper">

            <input type="text" ng-model="form.name"
                placeholder="Route/Problem Name (if applicable)"/>
        

            <div class="flag  mb1">
                <h3 class="flag-image">Grade</h3>

               <div class="flag-body">

                  <select class="[ select--tetriary  select--medium ] right" ng-model="form.boulderGrade"
                               ng-options="grade.name for grade in boulderGrades">
                   </select>

                   <select class="[ select--tetriary  select--medium ] right" ng-model="form.ropeGrade"
                               ng-options="grade.name for grade in ropeGrades">
                   </select>

               </div>

            </div>


            <div class="flag  mb1">

                <h3 class="flag-image">Setter</h3>

               <div class="flag-body">

                    <select class="[ select--tetriary  select--medium ] right" ng-model="form.setter"
                                ng-options="setter.name for setter in setters">
                    </select>

               </div>

            </div>


            <div class="flag  mb1">
                <h3 class="flag-image">Color</h3>

               <div class="flag-body">

                    <select class="[ select--secondary  select--medium ] right" ng-model="form.color"
                                ng-style="{color: text_color}"
                                ng-change="colorChanged()">
                        <option value="{{color.id}}"
                                    ng-style="{color: color.value}"
                                    ng-repeat="color in colors">
                            {{color.name}}
                        </option>
                    </select>

               </div>

            </div>

            <input type="text"  ng-model="form.note"
            placeholder="note">
            
            <button class="btn--primary  btn--medium  btn--expanded  icon-plus-squared"
                    ng-click="saveClicked()"
                    ng-show="isEditMode">
                Save Changes
            </button>

            <div class="add_setter"
                    ng-click="navigateToSetters()">
                <i class="icon-plus-squared"> </i>
            </div>

            <div class="btn_black"
                    ng-click="addClicked()"
                    ng-hide="isEditMode">
                <i class="icon-plus-squared"> </i> Add Route
            </div>

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
