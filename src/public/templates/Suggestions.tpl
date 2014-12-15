<div class="title">Community Suggestions</div>

<div class="suggestion"
    ng-repeat="suggestion in suggestions">
    <i class="icon-heart"
        ng-style="{'font-size': Math.max(50, (18 + suggestion.upvotes * 2)) + 'px'}"
        ng-click="upvote(suggestion)"> </i>
    {{suggestion.suggestion}}
</div>

<div>
    <textarea ng-model="form.suggestion" placeholder="Let's make SETTER together, post your suggestion!">
    </textarea>

    <div class="btn_black"
        ng-click="postSuggestion()">
        <i class="icon-plus-squared"> </i> Post
    </div>
</div>
