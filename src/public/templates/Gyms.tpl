<div class="btn_black"
    ng-click="back()">
    <i class="icon-left-big"> </i>Back
</div>

<div ng-repeat="gym in gyms">
    <div class="gym"
            ng-click="navigateToGym(gym.account_id)">
        {{gym.id}} {{gym.name}} {{gym.address}}
    </div>
</div>
