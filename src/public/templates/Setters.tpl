

<section class="header row small-collapse">

    <div class="small-12 columns">

        <h1>Manage Setters</h1>

    </div>

</section>

<section class="row"  ng-repeat="setter in setters" ng-hide="setter.hide">
    <div class="small-12 columns">
        <div class="setter mb4">
            <h2 class="mb0" >
                {{setter.firstname}} {{setter.lastname}}
            </h2>
            <div class="add">
                <i class="icon-minus-squared" ng-click="removeSetterClicked(setter)"> </i>
            </div>
        </div>
    
    
        <h2 class="title">Add Setters</h2>
            <div ng-repeat="user in users" ng-hide="user.hide">
            <div class="setter">
        {{user.firstname}} {{user.lastname}}
                <div class="add">
                <i class="icon-plus-squared" ng-click="addSetterClicked(user)"> </i>
                </div>
            </div>
        </div>
    </div>
</section>



