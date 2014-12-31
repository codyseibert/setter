<section class="row">
    <div class="small-12 columns header">
        <div class="left">
            <button class="[ btn--secondary btn--medium right ] icon-left-big"
                    ng-show="isUserAccount()"
                    ng-click="navigateToUser(getAccountId())" >
                Your Profile
            </button>
        </div>

        <section class="header">
            <h1 class="title">Gyms</h1>
        </section>

        <input name=""
                type="search"
                id="searchTerm"
                placeholder="Search"
                ng-model="form.search"
                ng-change="applySearch()" />
    </div>
</section>

<section class="row">
    <div class="small-12 columns header">
        <div ng-repeat="gym in gyms"
                style="cursor: pointer; border-bottom: 1px dotted #888;"
                ng-show="gym.show">
            <div class="gym"
                ng-click="navigateToGym(gym.account_id)">
                <h2>{{gym.name}}</h2>
                <h3>{{gym.address}}</h3>
            </div>
        </div>
    </div>
</section>
