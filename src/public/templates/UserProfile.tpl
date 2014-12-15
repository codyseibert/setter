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

<div class="graph">
    Boulder Routes Sent

    <canvas class="chart-bar"
        data="boulderSendsBarGraph.data"
        labels="boulderSendsBarGraph.labels"
        options="options"
        legend="true"
        width="100%"
        height="100%">
    </canvas>
</div>

<div class="graph">
    Rope Routes Sent

    <canvas class="chart-bar"
        data="ropeSendsBarGraph.data"
        labels="ropeSendsBarGraph.labels"
        options="options"
        legend="true"
        width="100%"
        height="100%">
    </canvas>
</div>

<div class="mb"></div>

<div class="graph">
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

<div class="graph">
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
