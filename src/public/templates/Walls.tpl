<div class="mb"></div>


<div class="btn_black small"
    ng-click="navigateToGym(gymId)">
    <i class="icon-left-big"> </i>Gym
</div>

<section class="header">

    <button class="btn--small  btn--tetriary "   ng-click="back()"><span class="icon-left-big">Back</span>
    </button>

    <h1 ng-show="isGymAccount()">Manage Your Zones</h1>
    <span ng-hide="isGymAccount()">Walls</span>

</section>

<!-- <div class="title">
    <span ng-show="isGymAccount()">Manage Your Walls</span>
    <span ng-hide="isGymAccount()">Walls</span>
</div> -->

<div class="row  small-collapse ">
    <div class="small-12  columns">
        <ul class="list--tableStyle">
            <li class="ptb2  fwb" ng-repeat="wall in walls">
                <a class="wall"
                    ng-click="navigateToWall(gymId, wall.id)">
                    {{wall.name}} <i class="icon-right-big right"> </i>
                </a>
            </li>
        </ul>
    </div>

    <a data-dropdown="drop1" aria-controls="drop1" aria-expanded="false">Has Dropdown</a>
<ul id="drop1" class="f-dropdown" data-dropdown-content aria-hidden="true" tabindex="-1">
  <li><a href="#">This is a link</a></li>
  <li><a href="#">This is another</a></li>
  <li><a href="#">Yet another</a></li>
</ul>

</div>

<div ng-show="isGymAccount()">
    <div>
        <input ng-model="form.wallName"
                placeholder="Wall Name"
                autocorrect="off"
                autocapitalize="off">
        </input>
    </div>

    <div class="mb"></div>
        <div class="btn_black" ng-click="addClicked()">
            <i class="icon-plus-squared"> </i> Add
        </div>
    </div>
</div>
