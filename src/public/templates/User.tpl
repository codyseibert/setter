<section class="row">
    <div class="header"
            ng-show="getHomeGymId()">
        <button class="btn--primary  btn--medium  icon-home btn--expanded"
                    ng-click="navigateToGym(getHomeGymId())">
            Go to Home Gym
        </button>
    </div>
</section>

<section class="row">
    <div class="small-12 columns mb2">

    <div class="flag">
        <div class="flag-image"
                ng-click="getAccountId() === userId && uploadImage()">
            <img ng-src="{{image.url !== '' && image.url || 'images/no_image.png'}}"  class="avatar--big">
        </div>

        <div class="flag-body">
            <h1 ng-show="getAccountId() === userId"> {{user.firstname}} {{user.lastname}}</h1>
<!--             <h1 class="mb0" ng-hide="getAccountId() === userId">{{user.firstname}} {{user.lastname}}</h1> -->
        </div>

    </div>

    </div>

    <div class="small-6 columns mb4  text-center">
        <h2 class="mb2">Bouldering</h2>
        <h3 class="fwb h1" ng-show="hasBoulderSends">{{boulderGrade}}</h3>
        <h3 class="fwb" ng-show="!hasBoulderSends">No bouldering sends, yet</h3>
    </div>

    <div class="small-6 columns mb4  text-center">
        <h2 class="mb2">YDS</h2>
        <h3 class="fwb h1" ng-show="hasRopeSends">{{ropeGrade}}</h3>
        <h3 class="fwb" ng-show="!hasRopeSends">No rope sends, yet</h3>
    </div>

</section>

<div class="row">
    <div class="small-12  columns  mb4">
            <h2>Latest Sends</h2>
            <div class="row small-collapse">
            <ul class="list list--tableStyle">
                <li  class="list-elem" ng-repeat="act in activity"
                        >
                    <span
                        ng-click="navigateToRoute(act.gym_id, act.wall_id, act.route_id)">
                        <i class="icon-circle icon--big" ng-style="{color: act.value}"> </i> {{act.bg || act.rg}} on {{act.date}}
                    </span>

                </li>
            </ul>
        </div>
    </div>
</div>



<section class="row">
    <div class="medium-6 small-12 columns mb2">
        <h2>Boulder Routes Sent</h2>
        <canvas class="chart-bar"
            ng-show="hasBoulderSends"
            data="boulderSendsBarGraph.data"
            labels="boulderSendsBarGraph.labels"
            options="chartOptions"
            legend="true"
            width="100%"
            height="100%">
        </canvas>

        <span ng-show="!hasBoulderSends">
            <h3 class="text-center fwb  mb2">No bouldering sends, yet.</h3>

            <h4 class="h6  text-center"
                ng-show="getAccountId() === userId">
                <br><a ng-click="navigateToGyms()">Set a home gym</a>, and track your progress by marking routes as "sent".
            </h4>
        </span>
    </div>

    <div class="medium-6 small-12 columns mb2">

        <h2>Rope Routes Sent</h2>

        <canvas class="chart-bar"
            ng-show="hasRopeSends"
            data="ropeSendsBarGraph.data"
            labels="ropeSendsBarGraph.labels"
            options="chartOptions"
            legend="true"
            width="100%"
            height="100%">
        </canvas>

        <span ng-show="!hasRopeSends">
            <h3 class="text-center fwb  mb2">No rope sends, yet.</h3>

            <h4 class="h6  text-center"
                ng-show="getAccountId() === userId">
                <br><a ng-click="navigateToGyms()">Set a home gym</a>, and track your progress by marking routes as "sent".
            </h4>
        </span>

    </div>
</section>

<section class="row">

    <div class="medium-6 small-12 columns mb2">

        <h2>V Grade Progress</h2>

        <canvas class="chart-line"
            ng-show="hasBoulderSends"
            data="boulderSendsLineGraph.data"
            labels="boulderSendsLineGraph.labels"
            options="boulderSendsLineGraph.options"
            legend="true"
            width="100%"
            height="100%">
        </canvas>

        <span ng-show="!hasBoulderSends">
            <h3 class="text-center fwb  mb2">No bouldering sends, yet.</h3>

            <h4 class="h6  text-center"
                ng-show="getAccountId() === userId">
                <br><a ng-click="navigateToGyms()">Set a home gym</a>, and track your progress by marking routes as "sent".
            </h4>
        </span>

    </div>

    <div class="medium-6 small-12 columns mb2">

        <h2>YDS Grade Progress</h2>

        <canvas class="chart-line"
            ng-show="hasRopeSends"
            data="ropeSendsLineGraph.data"
            labels="ropeSendsLineGraph.labels"
            options="ropeSendsLineGraph.options"
            legend="true"
            width="100%"
            height="100%">
        </canvas>

        <span ng-show="!hasRopeSends">
            <h3 class="text-center fwb  mb2">No rope sends, yet.</h3>

            <h4 class="h6  text-center"
                ng-show="getAccountId() === userId">
                <br><a ng-click="navigateToGyms()">Set a home gym</a>, and track your progress by marking routes as "sent".
            </h4>
        </span>

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
