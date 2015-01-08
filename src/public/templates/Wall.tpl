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

        <div ng-show="shouldShowWallImage()">
            <div>
                <img style="height: 100px; overflow: hidden; cursor: pointer;"
                        ng-click="getAccountId() === gymId && uploadImage()"
                        ng-src="{{image.url !== '' && image.url || 'images/no_gym_image.png'}}">
            </div>
        </div>

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
                <span class="icon--new label  success  border-radius" ng-show="isUserAccount() && route.isNew">New</span>
                <i class="icon-right-big  right"> </i>
            </li>
        </ul>

        <section class="row">
            <div class="small-12 columns  text-center mb4"
                ng-show="isGymAccount()"
                data-ui-component="routeSubActions">
                <a class="icon-trash"
                    ng-click="delete()">
                    Delete Zone Permanently
                </a>

                <div ng-repeat="object in objects" st-check>
                    {{object.name}}
                </div>
            </div>
        </section>
    </div>
</section>

<!-- hidden -->
<form id="image_form"
        style="display: none;"
        enctype="multipart/form-data"
        action="{{'/api/gyms/' + gymId + '/walls/' + wallId + '/image'}}"
        method="post"
        ng-upload="complete(content)">
    <input id="image_file"
        type="file"
        name="file" />
    <input id="image_submit"
        type="submit"></input>
    <input name="authorization"
        value="{{authorization}}"></input>
</form>
