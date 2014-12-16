<div class="title">Your Dashboard</div>

<div>
    <div class="btn_black" ng-click="navigateToWalls(gymId)">
        Walls
    </div>
</div>

<div class="graph">
    Current Boulder Routes

    <canvas class="chart-bar"
        data="boulderRoutesBarGraph.data"
        labels="boulderRoutesBarGraph.labels"
        options="chartOptions"
        legend="true"
        width="100%"
        height="100%">
    </canvas>
</div>

<div class="graph">
    Current Rope Routes

    <canvas class="chart-bar"
        data="ropeRoutesBarGraph.data"
        labels="ropeRoutesBarGraph.labels"
        options="chartOptions"
        legend="true"
        width="100%"
        height="100%">
    </canvas>
</div>
