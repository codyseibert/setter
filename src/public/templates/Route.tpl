

<section class="header row small-collapse">
    
    <div class="left">
        <button class="[ btn--secondary  btn--medium right ] icon-left-big"
            ng-click="navigateToWall(gymId, wallId)" >
            <span ng-show="isGymAccount()">Manage</span> Wall
        </button>
    </div>

</section>


<section class="row" ng-show="isGymAccount()" data-ui-component="route-actions">

    <div class="small-12  columns"> 

        <button class="[ btn--primary  btn--medium ] icon-pencil" ng-click="edit()" ng-hide="isEditMode">
            Edit 
        </button>

        <button class="btn--tetriary btn--medium icon-trash" ng-click="delete()">
            Delete Route
        </button>

    </div>

</section>  


<section class="row" data-ui-component="route-information">

    <div class="small-12 columns">

        <div class="route nohover ">
            <div class="media--fl">
                <div>
                    Color/Grade
                </div>

                <div class="icon-circle  icon--big  right" ng-style="{color: route.value}"> 
                     <h1 class="mb0 h4  display--inlineBlock">
                    {{route.route_name}}
                    
                    {{route.boulder_grade || route.rope_grade}}
                    </h1>
                </div>
            </div>
            
            <div class="media--fl">
                <span>Avg. Rating</span>
                <div class="[ rating  rating--big ]  display--inlineBlock"
                ng-class="{rated: hasRated}"
                ng-repeat="star in stars"
                ng-click="rate(star)"
                ng-mouseover="setHoverRating(star)"
                ng-mouseleave="setHoverRating(-1)">
                    <i ng-class="{'icon-star': isFilled(star), 'icon-star-empty': !isFilled(star)}" class="mb0  left"> </i>
                
                </div>
            </div>
            <div class="media--fl">
                <span class="display--inlineBlock">Routesetter</span>

                <h2 class="h4 display--inlineBlock right">
                    {{route.firstname}}
                    {{route.lastname}}
                </h2>
            </div>
        </div>

    </div>

</section>





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
