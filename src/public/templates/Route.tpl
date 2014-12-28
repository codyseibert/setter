

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

        <button class="btn--secondary btn--medium icon-trash" ng-click="delete()">
            Delete
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


<section class="row" data-ui-component="route-userActions">

    <div class="small-12 columns">

    <h5 class="sub_title">Sends</h5>

    <div ng-repeat="send in sends">
        <div class="send">
            {{send.firstname}} {{send.lastname}}
        </div>
    </div>

    <button class="[ btn--secondary  btn--medium  btn--expanded ] center icon-paper-plane-empty"
    ng-click="send()"
    ng-hide="hasSent"> Send
    </button>

    <button class=" [ btn--tetriary  btn--medium  btn--expanded ]  icon-paper-plane center enabled"
    ng-click="unsend()"
    ng-show="hasSent">
     Sent
    </button>

    <h5 >Comments</h5>

    <div ng-repeat="comment in comments">
        <div class="comment">
            {{comment.firstname}} {{comment.lastname}}
            <br>
            {{comment.message}}
            <br>
            {{comment.date}}
        </div>
    </div>

    <textarea class="textarea--small" ng-model="form.message"
                placeholder="comment">
    </textarea>

    <button class=" [ btn--primary  btn--medium btn--expanded ]  icon-plus-squared" ng-click="addComment()">Post Comment
    </button>

    </div>
</section>
