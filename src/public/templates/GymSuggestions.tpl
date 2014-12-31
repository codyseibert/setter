<section class="row">
    <div class="small-12 columns header">
        <h1 class="icon-mail-alt"> Suggestions</h1>
    </div>
</section>

<section class="row" ng-show="getAccountId() === gymId">
    <div class="medium-6 small-12 columns">
        <h2>Unread</h2>

        <div ng-show="!suggestion.read"
                ng-repeat="suggestion in suggestions"
                style="padding: 20px; display: inline-block; width: 240px; overflow: hidden;">
            <div style="margin-right: 10px; width: 50px; height: 50px; float: left; text-align: center; cursor: pointer;"
                ng-click="navigateToUser(suggestion.user_id)">
            <img ng-src="{{suggestion.url !== '' && suggestion.url || 'images/no_image.png'}}"
                style="height: 100%; width: 100%; border-radius: 50%; border: 2px solid #ed6d56;">
            </div>

            <div>
                {{suggestion.name}}<br>
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
                style="padding: 20px; display: inline-block; height: 70px; width: 240px; overflow: hidden;">
            <div style="margin-right: 10px; width: 50px; height: 50px; float: left; text-align: center; cursor: pointer;"
                ng-click="navigateToUser(suggestion.user_id)">
            <img ng-src="{{suggestion.url !== '' && suggestion.url || 'images/no_image.png'}}"
                style="height: 100%; width: 100%; border-radius: 50%; border: 2px solid #ed6d56;">
            </div>

            <div>
                {{suggestion.name}}<br>
                {{suggestion.message}}<br>
                {{suggestion.date}}
            </div>
        </div>
    </div>
</section>

<section class="row" ng-hide="getAccountId() === gymId">
    <div class="small-12 columns">
        <input type="search"
            placeholder="your suggestion to the gym"
            ng-model="form.message"></input>
        <button class="btn--primary  btn--medium  btn--expanded icon-paper-plane"
            ng-click="postSuggestion()">
            Post Suggestion
        </button>
    </div>
</section>
