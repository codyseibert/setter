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

    <dl class="accordion" data-accordion>
      <dd>
        <a href="#panel1">Accordion 1</a>
        <div id="panel1" class="content active">
          Panel 1 Content
        </div>
      </dd>
      <dd>
        <a href="#panel2">Accordion 2</a>
        <div id="panel2" class="content">
          Panel 2 Content
        </div>
      </dd>
      <dd>
        <a href="#panel3">Accordion 3</a>
        <div id="panel3" class="content">
          Panel 3 Content
        </div>
      </dd>
    </dl>

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
