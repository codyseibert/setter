
<div class="left mt1">
    <button class="[ btn--secondary btn--medium right ] icon-left-big"
        ng-click="navigateToWall(gymId, wallId)" >
        <span ng-show="isGymAccount()">Manage</span> Wall
    </button>
</div>

<br>

<div ng-show="isGymAccount()">
    <div class="button orange"
            ng-click="edit()"
            ng-hide="isEditMode">
        <i class="icon-pencil"> </i>
    </div>
    <div class="button orange"
            ng-click="delete()">
        <i class="icon-trash"> </i>
    </div>
</div>

<div class="route nohover">
    <i class="icon-circle" ng-style="{color: route.value}"> </i>
    {{route.route_name}}
    {{route.boulder_grade || route.rope_grade}}
    {{route.firstname}}
    {{route.lastname}}
</div>
<div class="mb"></div>
<div class="mb"></div>
<div class="mb"></div>

<div class="stars">
    <div class="star"
        ng-class="{rated: hasRated}"
        ng-repeat="star in stars"
        ng-click="rate(star)"
        ng-mouseover="setHoverRating(star)"
        ng-mouseleave="setHoverRating(-1)">
        <i ng-class="{'icon-star': isFilled(star), 'icon-star-empty': !isFilled(star)}"> </i>
    </div>
</div>
<div class="mb"></div>
<div class="mb"></div>
<div class="mb"></div>

<div>
    <div class="btn_small"
            ng-click="send()"
            ng-hide="hasSent">
        <i class="icon-paper-plane-empty"> </i> Send
    </div>
    <div class="btn_small enabled"
            ng-click="unsend()"
            ng-show="hasSent">
        <i class="icon-paper-plane"> </i> Sent
    </div>
</div>
<div class="mb"></div>
<div class="mb"></div>
<div class="mb"></div>

<div class="sub_title">Sends</div>
<div ng-repeat="send in sends">
    <div class="send">
        {{send.firstname}} {{send.lastname}}
    </div>
</div>
<div class="mb"></div>
<div class="mb"></div>
<div class="mb"></div>

<div class="sub_title">Comments</div>
<div ng-repeat="comment in comments">
    <div class="comment">
        {{comment.firstname}} {{comment.lastname}}
        <br>
        {{comment.message}}
        <br>
        {{comment.date}}
    </div>
</div>
<div class="mb"></div>

<textarea ng-model="form.message"
            placeholder="comment">
</textarea>
<div class="mb"></div>

<div>
    <div class="btn_black" ng-click="addComment()">
        <i class="icon-plus-squared"> </i> Comment
    </div>
</div>
