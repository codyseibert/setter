<section class="row small-collapse">

    <div class="header">

        <button class="[ btn--secondary  btn--medium ] mb2 icon-left-big display--block"
            ng-click="topNavigationClicked()" >
            <span ng-show="pageWasBookmarked() || lastPageWasZone()"> Zone</span>
            <span ng-show="lastPageWasUser()"> User</span>
            <span ng-show="!pageWasBookmarked() && !lastPageWasUser() && !lastPageWasZone()"> Gym</span>
        </button>

        <div  class="display--block" ng-show="isGymAccount()" data-ui-component="route-actions">

                <button class="[ btn--primary  btn--medium ] icon-pencil" ng-click="edit()" ng-hide="isEditMode">
                    Edit Route
                </button>

                <button class="btn--secondary btn--medium icon-down-big " ng-click="strip()">
                    Strip Route
                </button>
        </div>

        <h1>Route Information</h1>

    </div>

</section>

<section class="row" data-ui-component="route-information">

    <div class="small-12 columns  mb4">

            <div class="flag  mb3">

                <h3 class="flag-image">
                Name
                </h3>

               <div class="flag-body  text-right">

                    <h4 class="h3  mb0  fwb">
                       {{route.route_name || 'N/A'}}
                    </h4>

               </div>

            </div>

            <div class="flag  mb3">
                <h3 class="flag-image">
                Grade
                </h3>

               <div class="flag-body  text-right">

                <h4 class="h2  mb0">
                    {{formatGrade(route.boulder_grade, route.rope_grade)}}
                </h4>

               </div>

            </div>

            <div class="flag  mb3">
                <h3 class="flag-image">
                Color
                </h3>

               <div class="flag-body  text-right">

                <h4 class="h2  mb0">
                    <i class="icon-circle icon--big" ng-style="{color: route.value}"> </i>
                </h4>

               </div>

            </div>

             <div class="flag  mb3">
                <h3 class="flag-image">
                Zone
                </h3>

               <div class="flag-body  text-right">

                <h4 class="h3  mb0  fwb">
                   {{route.wall_name}}
                </h4>

               </div>

            </div>

            <div class="flag  mb3">
                <h3 class="flag-image">
                Setter
                </h3>

               <div class="flag-body  text-right">

                <h4 class="h3  mb0  fwb">
                   {{route.firstname}} {{route.lastname}}
                </h4>

               </div>

            </div>

            <div class="flag  mb3">

            <h3 class="flag-image">Avg. Rating</h3>

               <div class="flag-body  text-right">
                    <h4 class="mb0 h2 display--inlineBlock"
                            ng-class="{rated: hasRated}"
                            ng-repeat="star in stars"
                            ng-click="!isGymAccount() && rate(star)"
                            ng-mouseover="setHoverRating(star)"
                            ng-mouseleave="setHoverRating(-1)">
                        <i ng-class="{'icon-star': isFilled(star), 'icon-star-empty': !isFilled(star)}" class="rating  mb0  right"> </i>
                    </h4>

                </div>

            </div>

            <div class="flag  mb3">
                <h3 class="flag-image">
                    Date
                </h3>

                <div class="flag-body  text-right">

                    <h4 class="h3  mb0  fwb">
                        {{route.date}}
                    </h4>

                </div>

            </div>

            <div class="mb4">
                    <h3 class="h4 fwb  mb2">Notes</h3>
                    <p>{{route.note || 'N/A'}}</p>
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

<section class="row">

    <div class="small-12 columns  mb4">

        <h2 class='fwb'>Climber Feedback</h2>

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


<section class="row">

    <div class="small-12 columns  ">

        <h2 class="fwb">Route Sends</h2>
    </div>

    <div class="small-12 columns  mb4">

        <div class="flag" ng-repeat="send in sends">

            <div class=" flag-image" ng-click="navigateToUser(send.account_id)">
                <img ng-src="{{send.url !== '' && send.url || 'images/no_image.png'}}"
                     class="avatar--small ">
            </div>

            <div class="flag-body">
                {{send.name}}
            </div>

        </div>
    </div>

    <div class="small-12 columns  text-center"
            ng-show="getAccountId() === gymId">
        <a class="icon-trash" ng-click="delete()">
            Delete Route Permanently
        </a>
    </div>

</section>
