<section class="row">
    <div class="small-12 columns header"
            ng-show="getHomeGymId()">
        <button class="btn--primary  btn--medium  icon-home btn--expanded"
                    ng-click="navigateToGym(getHomeGymId())">
            View Your Home Gym <i class="icon-right-big"> </i>
        </button>
    </div>

    <div class="small-12 columns header">
        <h1 class="title icon-user" ng-show="getAccountId() === userId"> Your Profile</h1>
        <h1 class="title icon-user" ng-hide="getAccountId() === userId">{{user.firstname}} {{user.lastname}}</h1>
    </div>
</section>

<section class="row">
    <div class="small-12 columns mb4">
        <div class="picture"
                style="height: 200px; width: 200px; display: inline-block; cursor: pointer;"
                ng-click="getAccountId() === userId && uploadImage()">
            <img style="height: 100%; width: 100%; border-radius: 50%; border: 2px solid #ed6d56" ng-src="{{image.url !== '' && image.url || 'images/no_image.png'}}">
        </div>
    </div>

    <div class="medium-6 small-12 columns mb4">
        <h2>V Grade</h2>
        <h3>{{boulderGrade}}</h3>
    </div>

    <div class="medium-6 small-12 columns mb4">
        <h2>YDS Grade</h2>
        <h3>{{ropeGrade}}</h3>
    </div>
</section>

<section class="row">
    <div class="medium-6 small-12 columns mb2">
        <h2>Boulder Routes Sent</h2>
        <canvas class="chart-bar"
            ng-show="boulderSendsBarGraph.hasData"
            data="boulderSendsBarGraph.data"
            labels="boulderSendsBarGraph.labels"
            options="chartOptions"
            legend="true"
            width="100%"
            height="100%">
        </canvas>
    </div>

    <div class="medium-6 small-12 columns mb2">
        <h2>Rope Routes Sent</h2>
        <canvas class="chart-bar"
            ng-show="ropeSendsBarGraph.hasData"
            data="ropeSendsBarGraph.data"
            labels="ropeSendsBarGraph.labels"
            options="chartOptions"
            legend="true"
            width="100%"
            height="100%">
        </canvas>
    </div>
</section>

<section class="row">
    <div class="medium-6 small-12 columns mb2">
        <h2>V Grade Progress</h2>
        <canvas class="chart-line"
            data="boulderSendsLineGraph.data"
            labels="boulderSendsLineGraph.labels"
            options="boulderSendsLineGraph.options"
            legend="true"
            width="100%"
            height="100%">
        </canvas>
    </div>

    <div class="medium-6 small-12 columns mb2">
        <h2>YDS Grade Progress</h2>
        <canvas class="chart-line"
            data="ropeSendsLineGraph.data"
            labels="ropeSendsLineGraph.labels"
            options="ropeSendsLineGraph.options"
            legend="true"
            width="100%"
            height="100%">
        </canvas>
    </div>
</section>


<div class="row">
    <div class="small-12 medium">
        <h2>Latest Sends</h2>
        <div ng-repeat="act in activity"
                style="padding: 5px; display: inline-block;">
            <div style="background-color: #eee; border-radius: 20px; cursor: pointer; padding: 20px; display: inline-block; height: 70px; width: 260px; overflow: hidden;"
                ng-click="navigateToRoute(act.gym_id, act.wall_id, act.route_id)">
                <i class="icon-circle icon--big" ng-style="{color: act.value}"> </i> {{act.bg || act.rg}} on {{act.date}}
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
