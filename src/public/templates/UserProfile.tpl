<div class="button"
    ng-click="navigateToLogout()">
    <i class="icon-logout"> </i>
</div>

<div class="title">{{user.firstname}} {{user.lastname}}</div>

<div class="picture">
    <img src="http://www.googlecover.com/images/hover_img.png">
</div>

<div class="grade">
    <b>V Grade</b>
    <div ng-show="showBoulderGrade">
        {{boulderGrade}}
    </div>
    <div ng-hide="showBoulderGrade">
        Not enough sends!
    </div>
</div>

<div class="grade">
    <b>YDS Grade</b>
    <div ng-show="showRopeGrade">
        {{ropeGrade}}
    </div>
    <div ng-hide="showRopeGrade">
        Not enough sends!
    </div>
</div>

<div class="mb"></div>

<div class="graph_wrapper">
    <div class="bar-graph">
        Boulder Routes Sent

        <canvas class="chart-bar"
            data="boulderSendsBarGraph.data"
            labels="boulderSendsBarGraph.labels"
            options="chartOptions"
            legend="true"
            width="100%"
            height="100%">
        </canvas>
    </div>
</div>

<div class="graph_wrapper">
    <div class="bar-graph">
        Rope Routes Sent

        <canvas class="chart-bar"
            data="ropeSendsBarGraph.data"
            labels="ropeSendsBarGraph.labels"
            options="chartOptions"
            legend="true"
            width="100%"
            height="100%">
        </canvas>
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
