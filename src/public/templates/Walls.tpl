<section class="row  small-collapse">
    <div class="header">
        <div class="clearfix  display--block">
            <button ng-hide="isGymAccount()"
                    class="[ btn--secondary btn--medium left  ] icon-left-big  left "
                    ng-click="back()" >
                    Gym 
            </button>
        </div>
        <h1 ng-show="isGymAccount()" class="icon-th-list"> Manage Your Zones</h1>
        <h1 ng-hide="isGymAccount()" class="icon-th-list"> Gym Zones</h1>
    </div>
</section>

<section class="row">
    <div class="small-12 columns">

        <!--
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

        <div class="display--inlineBlock">
            <div class="select--tetriary select--small align-vertically">
                <select>
                    <option value="">Sort By</option>
                    <option value="higherRating"><a href="">▲ Rating</a></option>
                    <option value="lowerRating"><a href="">▼ Rating</a></option>
                    <option value="nameAToZ"><a href="">A-Z Name</a></option>
                    <option value="nameZToA"><a href="">Z-A Name</a></option>
                    <option value="newFirst"><a href="">Newest First</a></option>
                    <option value="oldFirst"><a href="">Oldest First</a></option>
                </select>
            </div>
        </div>

        <div class="display--inlineBlock  mb2">
            <div class="select--tetriary select--small align-vertically">
                <select name="wallTypes" id="wallTypes">
                    <option value="">Filter</option>
                    <option value="all">All Types</option>
                    <option value="bouldering">Bouldering</option>
                    <option value="topRope">Top Rope</option>
                    <option value="lead">Lead</option>
                </select>
            </div>
        </div>
        -->

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


<section class="row  small-collapse">

    <div class="small-12 columns">

        <ul class="list--tableStyle  list--navElem"  data-ui-component="gymZoneList">
            <li class="ptb2  fwb" ng-repeat="wall in walls"
                    ng-click="navigateToWall(gymId, wall.id)">

                    {{wall.name}}
                    <i class="icon-right-big right"> </i>
                </a>
            </li>
        </ul>
    </div>
</section>
