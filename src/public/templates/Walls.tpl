<div class="mb"></div>


<section class="header row small-collapse">
    <div class="small-12 columns">
    <button class="btn--small  btn--tetriary "   ng-click="back()"><span class="icon-left-big">Back</span>
    </button>

    <h1 ng-show="isGymAccount()">Manage Your Zones</h1>
    <span ng-hide="isGymAccount()">Walls</span>
    </div>



</section>

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


  <p>
    <a dropdown-toggle="#dropdown-example-1">Click me for a dropdown, yo!</a>
  </p>
  <ul id="dropdown-example-1" class="f-dropdown">
    <li ng-repeat="choice in items">
      <a>{{choice}}</a>
    </li>
  </ul>

  <a class="button dropdown" dropdown-toggle="#dropdown-example-2">Dropdowns can also have links!</a>
  <ul id="dropdown-example-2" class="f-dropdown">
    <li ng-repeat="(label, url) in linkItems">
      <a href="{{url}}" target="_blank">{{label}}</a>
    </li>
  </ul>

  <a class="button split">
    Split Button
    <span dropdown-toggle="#dropdown-example-3"></span>
  </a>
  <ul id="dropdown-example-3" class="f-dropdown">
    <li ng-repeat="choice in items">
      <a>{{choice}}</a>
    </li>
  </ul>

</div>
