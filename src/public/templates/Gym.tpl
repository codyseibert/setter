<section class="row">

    <div class="small-12 columns header">

        <div class="left"
                ng-show="isUserAccount()">
            <button class="[ btn--secondary btn--medium right ] icon-left-big"
                        ng-click="navigateToUser(getAccountId())" >
                Your Profile
            </button>
        </div>

    </div>


    <div class="small-12 columns  mb4">
        <div class="flag" ng-show="isGymAccount()">
            <div class="flag-image"
                    ng-click="getAccountId() === gymId && uploadImage()">
                <img class="avatar avatar--small" ng-src="{{image.url !== '' && image.url || 'images/no_gym_image.png'}}">
            </div>

            <h1  class="testQuery flag-body"> Your Dashboard
            </h1>
        </div>



        <div class="flag"  ng-show="isUserAccount()">
            <div class="flag-image"
                    ng-click="getAccountId() === gymId && uploadImage()">
                <img class="avatar avatar--big--nowidth" ng-src="{{image.url !== '' && image.url || 'images/no_gym_image.png'}}">
            </div>

            <h1 class="testQuery flag-body  mb2"> {{gym.name}}</h1>
        </div>
    </div>


    <div class="small-12 columns" ng-show="isGymAccount()">

    </div>

    <div class="mb4  small-12  medium-4 columns"
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
                View Gym's Zones
            </button>
        </div>

        <div class="medium-6 columns">
            <button ng-show="isUserAccount()" class="[ btn--secondary  btn--medium  btn--expanded ]  icon-messaging " ng-click="navigateToGymSuggestions(gymId)">
                Post Suggestion
            </button>
        </div>

    </div>

</section>


<div class="row  small-collapse  large-uncollapse  medium-uncollapse">
    <div class="small-12  large-12 columns">
        <div class="graph  small-12 medium-6 columns">
            <h2 class="fwb">Current Boulder Routes</h2>

            <canvas class="chart-bar"
                data="boulderRoutesBarGraph.data"
                labels="boulderRoutesBarGraph.labels"
                options="chartOptions"
                legend="true"
                width="100%"
                height="100%">
            </canvas>
        </div>


        <div class="graph  small-12 medium-6 columns">
            <h2 class="fwb">Current Rope Routes</h2>

            <canvas class="chart-bar"
                data="ropeRoutesBarGraph.data"
                labels="ropeRoutesBarGraph.labels"
                options="chartOptions"
                legend="true"
                width="100%"
                height="100%">
            </canvas>
        </div>
    </div>
</div>

<div class="row  small-collapse  large-uncollapse  medium-uncollapse">
    <div class="small-12 columns mb4">
        <h2>Latest Sends</h2>

            <div class="small-6 medium-3 large-3 columns   pb4"  style="min-height: 137px" ng-repeat="act in activity"
               >
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
</div>


<section class="row  small-collapse  large-uncollapse  medium-uncollapse">

    <div class="small-12 columns mb4">
        <h2>Gym Announcements</h2>

        <ul class="list--noStyles  list">
            <li ng-repeat="alert in alerts">
                <p>{{alert.message}}
                <span class="txt--micro  display--block">{{alert.date}}</span></p>
            </li>
        </ul>

    </div>

</section>

<div class="row small-collapse  large-uncollapse  medium-uncollapse">
    <div class="small-12  mb5  columns">
        <h2>Active Members</h2>

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
</div>


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
