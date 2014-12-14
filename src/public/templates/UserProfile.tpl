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

    <canvas class="chart chart-bar"
        data="boulderSendsBarGraph.data"
        labels="boulderSendsBarGraph.labels"
        options="options"
        legend="true">
    </canvas>
</div>

<div class="graph">
    Rope Routes Sent

    <canvas class="chart chart-bar"
        data="ropeSendsBarGraph.data"
        labels="ropeSendsBarGraph.labels"
        options="options"
        legend="true">
    </canvas>
</div>

<div class="mb"></div>
