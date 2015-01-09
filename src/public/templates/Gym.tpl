<div class="st--header">
    <section class="row">
        <div class="small-12 columns  mb4 header">
            <div class="flag" ng-show="isGymAccount()">
                <div class="flag-image"
                        ng-click="getAccountId() === gymId && uploadImage()">
                    <img class="avatar" style="width: 200px; border-radius: 10px;" ng-src="{{image.url !== '' && image.url || 'images/no_gym_image.png'}}">
                </div>

                <h1 class="testQuery flag-body">
                    Your Dashboard
                </h1>
            </div>

            <div class="flag"  ng-show="isUserAccount()">
                <div class="flag-image"
                        ng-click="getAccountId() === gymId && uploadImage()">
                    <img class="avatar" style="width: 200px; border-radius: 10px;" ng-src="{{image.url !== '' && image.url || 'images/no_gym_image.png'}}">
                </div>

                <h1 class="testQuery flag-body  mb2">
                    {{gym.name}}
                </h1>
            </div>
        </div>

        <div class="mb2  small-12  medium-4 columns"
                ng-hide="getHomeGymId() === gymId || isGymAccount()">
            <button class="btn--primary  btn--medium  icon-home btn--expanded"
                        ng-click="setHomeGym()">
                Make Home Gym
            </button>
        </div>
</section>

<section class="row  small-collapse  large-uncollapse  medium-uncollapse">
    <div class="mb4  small-12  large-6  columns">
        <div class="medium-6 columns  ">
            <button class="[ btn--primary  btn--medium  btn--expanded ]  icon-map" ng-click="navigateToWalls(gymId)">
                View Zones
            </button>
            <span class="icon--top--right icon--new label  success  border-radius" ng-show="isUserAccount() && newRoutes.count">{{newRoutes.count}} NEW ROUTES</span>
        </div>

        <div class="medium-6 columns">
            <button ng-show="isUserAccount()" class="[ btn--secondary  btn--medium  btn--expanded ]  icon-messaging " ng-click="navigateToGymSuggestions(gymId)">
                Post Suggestion
            </button>
        </div>
    </div>
</section>
</div>

<div class="row">
    <div class="small-12">
        <tabset>
            <tab select="hideCharts()">
                <tab-heading><i class="icon-archive"> </i> <span class="hide-for-small">Activity</span></tab-heading>
                <content>
                    <section class="row">
                        <div class="small-12 columns">
                            <h2>Latest Sends</h2>

                            <div class="small-6 medium-3 large-3 columns pb4" ng-repeat="act in activity">
                                <div class="flag">

                                    <div class="flag-image">
                                        <img class="avatar avatar--small  center mb1"
                                        ng-click="navigateToUser(act.id)"
                                        ng-src="{{act.url !== '' && act.url || 'images/no_image.png'}}">
                                    </div>

                                    <div class="flag-body" ng-click="navigateToRoute(gymId, act.wall_id, act.route_id)">

                                        <a>{{act.name}}<br><i class="icon-circle icon--big" ng-style="{color: act.value}"> </i> {{formatGrade(act.bg, act.rg)}}</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </content>
            </tab>


            <tab select="hideCharts()">
                <tab-heading><i class="icon-megaphone"> </i><span class="hide-for-small">News</span></tab-heading>
                <content>
                    <section class="row">
                        <div class="small-12 columns">
                            <h2>Gym Announcements</h2>

                            <ul class="list--noStyles  list">
                                <li ng-repeat="alert in alerts">
                                    <p>{{alert.message}}
                                        <span class="txt--micro  display--block">{{alert.date}}</span>
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </section>
                </content>
            </tab>


            <tab select="showCharts()">
                <tab-heading><i class="icon-dashboard"> </i><span class="hide-for-small">Stats</span></tab-heading>
            </tab>


            <tab select="hideCharts()">
                <tab-heading><i class="icon-group"> </i><span class="hide-for-small">Climbers</span></tab-heading>
                <content>
                    <section class="row">
                        <div class="small-12 columns">
                            <h2>Gym's Climbers</h2>
                            <div class="small-6 medium-3 large-3 columns   pb4" ng-repeat="user in users"
                                ng-click="navigateToUser(user.id)">
                            <div class="flag">
                                <div class="flag-image">
                                    <img class="avatar avatar--small  center mb1" ng-src="{{user.url !== '' && user.url || 'images/no_image.png'}}">
                                </div>
                                <div class="flag-body">
                                    <a class="h5  display--block  center">
                                        {{user.name}}</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </content>
            </tab>
        </tabset>
    </div>
</div>



<section class="row" id="charts" style="position: absolute; top: -44px; left: -9999px">
    <div class="small-12 medium-6 columns">
        <h2>Current Boulder Routes</h2>

        <canvas
            class="chart-bar"
            data="boulderRoutesBarGraph.data"
            labels="boulderRoutesBarGraph.labels"
            options="chartOptions"
            legend="true"
            width="100%"
            height="100%">
        </canvas>
    </div>

    <div class="small-12 medium-6 columns">
        <h2>Current Rope Routes</h2>

        <canvas
            class="chart-bar"
            data="ropeRoutesBarGraph.data"
            labels="ropeRoutesBarGraph.labels"
            options="chartOptions"
            legend="true"
            width="100%"
            height="100%">
        </canvas>
    </div>
</section>




<!-- hidden -->
<form id="image_form"
        style="display: none;"
        enctype="multipart/form-data"
        action="{{'/api/accounts/image'}}"
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
