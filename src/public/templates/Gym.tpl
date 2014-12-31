<section class="row">
    <div class="small-12 columns header">
        <div class="left">
            <button class="[ btn--secondary btn--medium right ] icon-left-big"
                        ng-show="isUserAccount()"
                        ng-click="navigateToUser(getAccountId())" >
            Your Profile
            </button>
        </div>

        <section class="header">
            <h1 class="title"
                    ng-show="isGymAccount()" >Your Dashboard</h1>
            <h2 >{{gym.name}}</h2>
        </section>

        <div class="mb4  small-12  medium-4 columns"
                ng-hide="getHomeGymId() === gymId || isGymAccount()">
            <button class="btn--primary  btn--medium  icon-home btn--expanded"
                        ng-click="setHomeGym()">
                Make Home Gym
            </button>
        </div>
    </div>
</section>


<div class="row">
    <div class="mb4  small-12  medium-4 columns">
        <button class="btn--primary  btn--medium  btn--expanded" ng-click="navigateToWalls(gymId)">
            View All Zones <i class="icon-right-big"> </i>
        </button>
    </div>
</div>


<div class="row">
    <div class="small-12 medium">
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

<div class="row">
    <div class="small-12 medium">
        <h2>Members</h2>
        <div ng-repeat="user in users"
                style="padding: 20px; vertical-align: top; width: 150px; height: 150px; display: inline-block; width: 150px; cursor: pointer; text-align: center; font-size: 16px;"
                ng-click="navigateToUser(user.id)">
            <img ng-src="{{user.url !== '' && user.url || 'images/no_image.png'}}"
                    style="height: 100%; width: 100%; border-radius: 50%; border: 2px solid #ed6d56;">
            {{user.name}}
        </div>
    </div>
</div>
