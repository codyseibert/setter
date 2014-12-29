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

<div class="picture"
        ng-click="getAccountId() === userId && uploadImage()">
    <img ng-src="{{image.url !== '' && image.url || 'images/no_image.png'}}">
</div>

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

<div class="grade_wrapper">
    <div class="grade">
        <b>V Grade</b>
        <div ng-show="showBoulderGrade">
            {{boulderGrade}}
        </div>
        <div ng-hide="showBoulderGrade">
            Not enough sends!
        </div>
    </div>
</div>

<div class="grade_wrapper">
    <div class="grade">
        <b>YDS Grade</b>
        <div ng-show="showRopeGrade">
            {{ropeGrade}}
        </div>
        <div ng-hide="showRopeGrade">
            Not enough sends!
        </div>
    </div>
</div>

<div class="mb"></div>

<div class="graph_wrapper">
    <div class="bar-graph">
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

        <div ng-hide="boulderSendsBarGraph.hasData" style="padding-top: 100px;">
            User has no sends!
        </div>
    </div>
</div>

<div class="graph_wrapper">
    <div class="bar-graph">
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

        <div ng-hide="ropeSendsBarGraph.hasData" style="padding-top: 100px;">
            User has no sends!
        </div>
    </div>
</div>

<div class="mb"></div>

<div class="graph_wrapper">
    <div class="line-graph">
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
</div>

<div class="graph_wrapper">
    <div class="line-graph">
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
</div>
