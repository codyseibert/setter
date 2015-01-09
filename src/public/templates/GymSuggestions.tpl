<div class="st--header mb2">
    <section class="row">
        <div class="small-12 columns header" ng-hide="getAccountId() === gymId">
            <div class="left">
                <button class="[ btn--secondary btn--medium right ] icon-left-big"
                    ng-click="back()" >
                    Back
                </button>
            </div>
        </div>

        <div class="small-12 columns header">
            <h1 class="icon-messaging" ng-show="getAccountId() === gymId"> Your Members' Suggestions</h1>
            <h1 class="icon-mail-alt" ng-show="getAccountId() !== gymId"> Post Suggestion</h1>
        </div>
    </section>
</div>

<section class="row" ng-show="getAccountId() === gymId">
    <div class="medium-6 small-12 columns">
        <h2>Unread</h2>

        <div ng-show="!suggestion.read"
                ng-repeat="suggestion in suggestions"
                class="media--fl">
            <div style="margin-right: 10px; width: 50px; height: 50px; float: left; text-align: center; cursor: pointer;"
                ng-click="navigateToUser(suggestion.user_id)">
            <img ng-src="{{suggestion.url !== '' && suggestion.url || 'images/no_image.png'}}"
                style="height: 100%; width: 100%; border-radius: 50%; border: 2px solid #ed6d56;">
            </div>

            <div>
                <b>{{suggestion.name}}</b><br>
                {{suggestion.date}}<br><br>
                {{suggestion.message}}<br><br>
                <button ng-click="read(suggestion)"
                    class="btn--primary  btn--medium  btn--expanded icon-mail-alt">
                    Mark as Read
                </button>
            </div>
        </div>
    </div>

    <div class="medium-6 small-12 columns">
        <h2>Read</h2>

        <div ng-show="suggestion.read"
                ng-repeat="suggestion in suggestions"
                class="media--fl">
            <div style="margin-right: 10px; width: 50px; height: 50px; float: left; text-align: center; cursor: pointer;"
                ng-click="navigateToUser(suggestion.user_id)">
            <img ng-src="{{suggestion.url !== '' && suggestion.url || 'images/no_image.png'}}"
                style="height: 100%; width: 100%; border-radius: 50%; border: 2px solid #ed6d56;">
            </div>

            <div>
                <b>{{suggestion.name}}</b><br>
                {{suggestion.date}}<br><br>
                {{suggestion.message}}<br><br>
            </div>
        </div>
    </div>
</section>

<section class="row" ng-hide="getAccountId() === gymId">
    <div class="small-12   large-6  columns">
        <div class="fieldwrapper">
            <textarea class="textarea--small"  type="text"
                placeholder="write a suggestion to your gym here"
                ng-model="form.message"/>

            <button class="btn--primary  btn--medium  btn--expanded icon-paper-plane"
                ng-click="postSuggestion()">
                Post Suggestion
            </button>
        </div>
    </div>
</section>
