<section class="header row small-collapse">
    <div class="left">
        <button class="[ btn--secondary btn--medium right ] icon-left-big"
                ng-click="navigateToGym(gymId)" >
            To Gym
        </button>
    </div>

    <div class="small-12 columns">
        <h1 ng-show="isGymAccount()">Manage Your Zones</h1>
        <h1 ng-hide="isGymAccount()" class="title">Walls</h1>
    </div>
</section>

<section class="row">
    <div class="small-12 columns">
        <div class="media--fl">
            <div>
                <label for="searchTerm" class="icon--label icon--search inline"></label>
            </div>

            <div>
                <input name=""
                        type="search"
                        id="searchTerm"
                        placeholder="Search by name, color, setter, route grades, etc.">
            </div>
        </div>

        <div class="media--fl" ng-show="isGymAccount()">
            <button type="submit"
                        alt="Add New Zone"
                        class="btn--primary icon-plus-squared btn--medium "
                        ng-click="addClicked()">
                Add Zone
            </button>

            <div>
                <input type="text"
                        name="name"
                        id="wallName"
                        placeholder="New zone Name"
                        ng-model="form.wallName"/>
            </div>
        </div>
    </div>
</section>

<ul class="list--tableStyle"  data-ui-component="gymZoneList">
    <li class="ptb2  fwb" ng-repeat="wall in walls"
            ng-click="navigateToWall(gymId, wall.id)">
        <a class="wall">
            {{wall.name}} <i class="icon-right-big right"> </i>
        </a>
    </li>
</ul>
