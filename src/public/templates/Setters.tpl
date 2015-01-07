<section class="row">

    <div class="small-12 columns header">

        <h1 class="icon-group"> Manage Setters</h1>

        <button class="[ btn--primary  btn--medium ] icon-pencil"
                ng-click="navigateToAddSetter(gymId)">
            Add Setter
        </button>

    </div>

</section>

<section class="row mb4">

    <div class="small-12 columns mb4">

        <h2 class="fwb">Your Setters</h2>

        <div ng-repeat="setter in setters" ng-hide="setter.hide" class="mb2" style="display: inline-block; width: 300px;">
            <div style="width: 60px; height: 60px; display: inline-block; cursor: pointer; text-align: center; font-size: 16px;"
                    ng-click="navigateToUser(setter.account_id)">
                <img ng-src="{{setter.url !== '' && setter.url || 'images/no_image.png'}}"
                style="height: 100%; width: 100%; border-radius: 50%; border: 2px solid #ed6d56;">
            </div>
            <h3 style="display: inline-block;">
                {{setter.firstname}} {{setter.lastname}}
            </h3>
            <br>

            <h4 class="mb0"
                style="display: inline-block;"
                ng-repeat="star in setter.stars">
                <i ng-class="{'icon-star': isFilled(star, setter), 'icon-star-empty': !isFilled(star, setter)}"> </i>
            </h4>
            ({{setter.rating}})
            <br>
            <i class="icon-minus" style="cursor: pointer;" ng-click="removeSetterClicked(setter)"> </i>
            <br>
            <b>Total Routes Set</b>
            <br>
            Boulder {{setter.num_boulder_routes}}<br>
            Rope {{setter.num_rope_routes}}<br>
        </div>

    </div>
</section>
