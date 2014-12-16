<div class="mb"></div>

<div class="btn_black small"
    ng-click="back()">
    <i class="icon-left-big"> </i>Back
</div>

<div class="title">{{gym.name}}</div>

<div class="btn_black small"
        ng-click="navigateToWalls(gymId)">
    Walls<i class="icon-right-big"> </i>
</div>

<div class="mb"></div>

<div class="btn_black small"
    ng-hide="getHomeGymId()"
    ng-click="setHomeGym()">

    <div class="right">
        Make Home Gym
    </div>
    <i class="icon-home"> </i>
</div>

<br>

<div class="graph_wrapper">
    <div class="bar-graph">
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
</div>

<div class="graph_wrapper">
    <div class="bar-graph">
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
</div>
