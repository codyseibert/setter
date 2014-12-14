<div class="btn_black"
    ng-click="back()">
    <i class="icon-left-big"> </i>Back
</div>

<div class="title">{{route.route_name}}</div>

{{route.boulder_grade || route.rope_grade}} {{route.firstname}} {{route.lastname}} {{route.value}} {{rating.rating}}


<div>
    <div class="btn_small"
            ng-click="send()"
            ng-hide="hasSent">
        <i class="icon-paper-plane-empty"> </i> Unsent
    </div>
    <div class="btn_small enabled"
            ng-click="unsend()"
            ng-show="hasSent">
        <i class="icon-paper-plane"> </i> Sent!
    </div>
</div>

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

<div ng-repeat="send in sends">
    <div class="send">
        {{send.account_id}} {{send.firstname}} {{send.lastname}}
    </div>
</div>

<div ng-repeat="comment in comments">
    <div class="comment">
        {{comment.id}} {{comment.account_id}} {{comment.firstname}} {{comment.lastname}} {{comment.message}} {{comment.date}}
    </div>
</div>

<textarea ng-model="form.message"
            placeholder="comment">
</textarea>

<div>
    <div class="btn_black" ng-click="addComment()">
        <i class="icon-plus-squared"> </i> Add Comment
    </div>
</div>
