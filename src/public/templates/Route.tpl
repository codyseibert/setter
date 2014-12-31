<section class="row">
    <div class="small-12 columns header">
        <div class="left">
            <button class="[ btn--secondary  btn--medium right ] icon-left-big"
                ng-click="navigateToWall(gymId, wallId)" >
                <span ng-show="isGymAccount()" class="icon-ellipsis-vert"> Manage</span> Wall
            </button>
        </div>
    </div>
</section>

<section class="row" ng-show="isGymAccount()" data-ui-component="route-actions">
    <div class="small-12 columns mb4">
        <button class="[ btn--primary  btn--medium ] icon-pencil" ng-click="edit()" ng-hide="isEditMode">
            Edit
        </button>

        <button class="btn--secondary btn--medium icon-down-big" ng-click="strip()">
            Strip
        </button>

        <button class="btn--secondary btn--medium icon-trash" ng-click="delete()">
            Delete
        </button>
    </div>
</section>

<section class="row" data-ui-component="route-information" style="margin-bottom: 60px;">
    <div class="small-12 columns">
        <h2><i>Route Info</i></h2>

        <div class="mb3" style="font-size: 20px;">
            {{route.name}}
        </div>

        <div class="mb4" style="font-size: 20px;">
            <i class="icon-circle icon--big" ng-style="{color: route.value}"> </i>
            {{route.boulder_grade || route.rope_grade}}
        </div>

        <div class="mb3">
            <div style="display: inline-block; font-size: 30px;"
                    ng-class="{rated: hasRated}"
                    ng-repeat="star in stars"
                    ng-click="!isGymAccount() && rate(star)"
                    ng-mouseover="setHoverRating(star)"
                    ng-mouseleave="setHoverRating(-1)">
                <i ng-class="{'icon-star': isFilled(star), 'icon-star-empty': !isFilled(star)}" class="mb0  left"> </i>
            </div>
        </div>

        <div style="padding-left: 5px; font-size: 20px;" class="mb3">
            Set by <b>{{route.firstname}} {{route.lastname}}</b>
        </div>

        <div ng-hide="isGymAccount()">
            <button class="[ btn--secondary  btn--medium  btn--expanded ] center icon-paper-plane-empty"
                        ng-click="send()"
                        ng-hide="hasSent">
                Send
            </button>

            <button class=" [ btn--tetriary  btn--medium  btn--expanded ]  icon-paper-plane center enabled"
                        ng-click="unsend()"
                        ng-show="hasSent">
                Sent
            </button>
        </div>
    </div>
</section>

<section class="row" style="margin-bottom: 100px;">
    <div class="small-12 columns">
        <h2><i>Sends</i></h2>

        <div ng-repeat="send in sends"
                style="width: 100px; text-align: center; display: inline-block;">
            <div style="width: 60px; height: 60px; display: inline-block; cursor: pointer; text-align: center; font-size: 16px;"
                    ng-click="navigateToUser(send.account_id)">
                <img ng-src="{{send.url !== '' && send.url || 'images/no_image.png'}}"
                    style="height: 100%; width: 100%; border-radius: 50%; border: 2px solid #ed6d56;">
            </div>
            <div>
                {{send.name}}
            </div>
        </div>
    </div>
</section>

<section class="row">
    <div class="small-12 columns">
        <h2><i>Comments</i></h2>

        <div ng-repeat="comment in comments"
                style="padding: 20px; margin-bottom: 20px; display: inline-block; vertical-align: top; max-height: 160px; width: 300px; text-align: left;">

            <div style="height: 60px;">
                <div style="float: left;">
                    <div style="width: 60px; height: 60px; margin-right: 20px; cursor: pointer; text-align: center; font-size: 16px;"
                            ng-click="navigateToUser(comment.account_id)">
                        <img ng-src="{{comment.url !== '' && comment.url || 'images/no_image.png'}}"
                                style="height: 100%; width: 100%; border-radius: 50%; border: 2px solid #ed6d56;">
                    </div>
                </div>

                <b>{{comment.name}}</b>
                <br>
                <i>{{comment.date}}</i>
            </div>

            <div>
                <div class="mb1">
                </div>
                {{comment.message}}
            </div>
        </div>

        <div ng-hide="isGymAccount()">
            <textarea class="textarea--small"
                        ng-model="form.message"
                        placeholder="comment">
            </textarea>

            <button class=" [ btn--primary  btn--medium btn--expanded ]  icon-plus-squared"
                        ng-click="addComment()">Post Comment
            </button>
        </div>
    </div>
</section>
