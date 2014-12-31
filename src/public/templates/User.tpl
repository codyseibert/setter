<section class="row">
    <div class="header"
            ng-show="getHomeGymId()">
        <button class="btn--primary  btn--medium  icon-home btn--expanded"
                    ng-click="navigateToGym(getHomeGymId())">
            View Your Home Gym <i class="icon-right-big"> </i>
        </button>
    </div>

    <div class="small-12 columns header">

    </div>
</section>

<section class="row">
    <div class="small-12 columns mb4">
<div class="flag">
    <div class="flag-image"
            ng-click="getAccountId() === userId && uploadImage()">
        <img ng-src="{{image.url !== '' && image.url || 'images/no_image.png'}}"  class="avatar--big">
    </div>

    <div class="flag-body">  
        <h1 class="title icon-user" ng-show="getAccountId() === userId"> Your Profile</h1>
        <h1 class="mb0" ng-hide="getAccountId() === userId">{{user.firstname}} {{user.lastname}}</h1>
    </div>

</div>
    </div>

    <div class="small-6 columns mb4  text-center">
        <h2 class="mb2">Bouldering</h2>
        <h3 class="fwb h1">{{boulderGrade}}</h3>
    </div>

    <div class="small-6 columns mb4  text-center">
        <h2 class="mb2">YDS</h2>
        <h3 class="fwb h1">{{ropeGrade}}</h3>
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
