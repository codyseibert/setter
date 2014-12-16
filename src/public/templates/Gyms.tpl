<div class="btn_black small"
    ng-click="back()">
    <i class="icon-left-big"> </i>Back
</div>

<div class="mb"></div>

<div class="title">Gyms</div>

<div ng-repeat="gym in gyms">
    <div class="gym"
            ng-click="navigateToGym(gym.account_id)">
        <div class="name">
            {{gym.name}}
        </div>

        <div class="address">
            {{gym.address}}
        </div>
    </div>
</div>
