<section class="row">
    <div class="small-12 columns header">
        <div class="left">
            <button class="[ btn--secondary btn--medium right ] icon-left-big"
                        ng-click="navigateToWalls(gymId)" >
                <span ng-show="isGymAccount()"> Manage</span> Zones
            </button>
        </div>
    </div>

    <div class="small-12 columns">
        <div class="media--fl" ng-show="isEditMode">

            <input ng-model="form.name" type="text">
            </input>

            <button class="btn--medium  btn--primary " ng-click="save()">
                Save
            </button>
        </div>

        <h1 ng-hide="isEditMode" class="title">
            {{wall.name}}
            <a class="icon-pencil" ng-click="edit()" ng-hide="isUserAccount() || isEditMode"></a>
        </h1>
    </div>
</section>

<section class="row  small-collapse">
    <div class="small-12 columns">
        <div ng-show="isGymAccount()" class="row" data-ui-component="routeActions">
            <div class="small-12 columns mb2">
                <button class="btn--medium btn--primary icon-plus btn--expanded"
                    ng-click="navigateToCreateRoute(gymId, wallId)">
                    Add Route
                </button>
            </div>
        </div>

        <ul class="list--tableStyle  list--navElem">
            <li ng-repeat="route in routes" ng-click="navigateToRoute(gymId, wallId, route.id)" class="list--tableStyle  ptb2">
                <i class="icon-circle"
                ng-style="{color: route.value}"> </i>
                {{route.route_name}} {{route.boulder_grade || route.rope_grade || 'Not Rated'}}

                <i class="icon-right-big  right"> </i>
            </li>
        </ul>

        <section class="row">
            <div class="small-12 columns  text-center"
                ng-show="isGymAccount()"
                data-ui-component="routeSubActions">
                <a class="icon-trash"
                    ng-click="delete()">
                    Delete Zone
                </a>
            </div>
        </section>
    </div>
</section>
