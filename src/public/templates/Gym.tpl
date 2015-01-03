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


    <div class="small-12 columns">
        <h1 ng-show="isGymAccount()" class="icon-home testQuery"> Your Dashboard</h1>
        <h1 ng-show="isUserAccount()" class="icon-home testQuery"> {{gym.name}}</h1>
    </div>


    <div class="small-12 columns" ng-show="isGymAccount()">
        <div class="picture mb4"
            style="height: 100px; width: 300px; display: inline-block; cursor: pointer; border: 2px dotted black;"
                ng-click="getAccountId() === gymId && uploadImage()">
            <img style="height: 100%" ng-src="{{image.url !== '' && image.url || 'images/no_gym_image.png'}}">
        </div>
    </div>

    <div class="mb4  small-12  medium-4 columns"
            ng-hide="getHomeGymId() === gymId || isGymAccount()">
        <button class="btn--primary  btn--medium  icon-home btn--expanded"
                    ng-click="setHomeGym()">
            Make Home Gym
        </button>
    </div>

</section>


<section class="row  small-collapse">

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

<section class="row">

    <div class="small-12 columns mb4">
        <h2 class="icon-attention">Gym Alerts</h2>

        <ul class="list--noStyles  list">
            <li ng-repeat="alert in alerts">
                <p>{{alert.message}}
                <span class="txt--micro  display--block">{{alert.date}}</span></p>
            </li>
        </ul>

    </div>

</section>

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
        <h2>Latest Activity</h2>
        <div ng-repeat="act in activity"
                style="padding: 20px; display: inline-block; height: 70px; width: 240px; overflow: hidden;">
            <div style="margin-right: 10px; width: 50px; height: 50px; float: left; text-align: center; cursor: pointer;"
                ng-click="navigateToUser(act.id)">
                <img ng-src="{{act.url !== '' && act.url || 'images/no_image.png'}}"
                    style="height: 100%; width: 100%; border-radius: 50%; border: 2px solid #ed6d56;">
            </div>

            <div>
                {{act.name}}<br>sent <i class="icon-circle icon--big" ng-style="{color: act.value}"> </i> {{act.bg || act.rg}}
            </div>
        </div>
    </div>
</div>


<div class="row">
    <div class="small-12 medium">
        <h2>Members</h2>
        <div ng-repeat="user in users"
                style="padding: 20px; vertical-align: top; width: 150px; height: 150px; display: inline-block; cursor: pointer; text-align: center; font-size: 16px;"
                ng-click="navigateToUser(user.id)">
            <img ng-src="{{user.url !== '' && user.url || 'images/no_image.png'}}"
                    style="height: 100%; width: 100%; border-radius: 50%; border: 2px solid #ed6d56;">
            {{user.name}}
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
