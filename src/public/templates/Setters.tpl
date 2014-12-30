<section class="row">
    <div class="small-12 columns header">
        <div class="left">
            <button class="[ btn--secondary btn--medium right ] icon-left-big"
                ng-click="navigateToGym(getAccountId())" >
                To Gym
            </button>
        </div>
    </div>

    <div class="small-12 columns header">
        <h1>Manage Setters</h1>
    </div>
</section>

<section class="row mb4">
    <div class="small-12 columns">
        <h2><b>Your Setters</b></h2>

        <div ng-repeat="setter in setters" ng-hide="setter.hide">
            <h2>{{setter.firstname}} {{setter.lastname}}
            <i class="icon-minus-squared" ng-click="removeSetterClicked(setter)"> </i></h2>
        </div>
    </div>
</section>

<section class="row">
    <div class="small-12 columns">
        <h2><b>Users</b></h2>

        <div ng-repeat="user in users" ng-hide="user.hide">
            <h2>{{user.firstname}} {{user.lastname}}
            <i class="icon-plus-squared" ng-click="addSetterClicked(user)"> </i></h2>
        </div>
    </div>
</section>
