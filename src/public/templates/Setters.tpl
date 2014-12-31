<section class="row">
    <div class="small-12 columns header">
        <div class="left">
            <button class="[ btn--secondary btn--medium right ] icon-left-big"
                ng-click="navigateToGym(getAccountId())" >
                <i class="icon-home"> </i> Gym
            </button>
        </div>
    </div>

    <div class="small-12 columns header">
        <h1 class="icon-users"> Manage Setters</h1>
    </div>
</section>

<section class="row mb4">
    <div class="medium-6 small-12 columns mb4">
        <h2><b>Your Setters</b></h2>

        <div ng-repeat="setter in setters" ng-hide="setter.hide" class="mb2">
            <div style="width: 60px; height: 60px; display: inline-block; cursor: pointer; text-align: center; font-size: 16px;"
                    ng-click="navigateToUser(setter.account_id)">
                <img ng-src="{{setter.url !== '' && setter.url || 'images/no_image.png'}}"
                style="height: 100%; width: 100%; border-radius: 50%; border: 2px solid #ed6d56;">
            </div>
            <h2 style="display: inline-block;">{{setter.firstname}} {{setter.lastname}}
            <i class="icon-minus-squared" style="cursor: pointer;" ng-click="removeSetterClicked(setter)"> </i></h2>
        </div>
    </div>

    <div class="medium-6 small-12 columns">
        <h2><b>Users</b></h2>

        <div ng-repeat="user in users" ng-hide="user.hide" class="mb2">
            <div style="width: 60px; height: 60px; display: inline-block; cursor: pointer; text-align: center; font-size: 16px;"
                ng-click="navigateToUser(user.account_id)">
                <img ng-src="{{user.url !== '' && user.url || 'images/no_image.png'}}"
                style="height: 100%; width: 100%; border-radius: 50%; border: 2px solid #ed6d56;">
            </div>
            <h2 style="display: inline-block;">{{user.firstname}} {{user.lastname}}
            <i class="icon-plus-squared" style="cursor: pointer;" ng-click="addSetterClicked(user)"> </i></h2>
        </div>
    </div>
</section>
