<section class="header row small-collapse">
    <div class="mb4  small-12  medium-4 columns"
            ng-show="getHomeGymId()">
        <button class="btn--primary  btn--medium  icon-home btn--expanded"
                    ng-click="navigateToGym(getHomeGymId())">
            View Home Gym
        </button>
    </div>

    <div class="small-12 columns">
        <h1 class="title" ng-show="getAccountId() === userId">Your Profile</h1>
        <h1 class="title" ng-hide="getAccountId() === userId">{{user.firstname}} {{user.lastname}}</h1>
    </div>
</section>

<div class="small-12 columns mb2">
    <div class="picture"
            style="height: 200px; width: 200px; display: inline-block; cursor: pointer;"
            ng-click="getAccountId() === userId && uploadImage()">
        <img style="height: 100%; width: 100%; border-radius: 50%; border: 2px solid #ed6d56" ng-src="{{image.url !== '' && image.url || 'images/no_image.png'}}">
    </div>
</div>

<div class="medium-6 small-12 columns mb2">
    <b>V Grade</b>
    <br>
    {{boulderGrade}}
</div>

<div class="medium-6 small-12 columns mb2">
    <b>YDS Grade</b>
    <br>
    {{ropeGrade}}
</div>

<section class="row">
    <div class="medium-6 small-12 columns mb2">
        Boulder Routes Sent

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
        Rope Routes Sent

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
        V Grade Progress
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
        YDS Grade Progress
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
