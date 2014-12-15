<div class="title">Suggestions</div>

<div ng-repeat="suggestion in suggestions">
    <div class="suggestion">
        <i class="icon-thumbs-up-alt heart"
            ng-class="{disabled: suggestion.disabled}"
            ng-style="{'font-size': getFontSize(suggestion) + 'px'}"
            ng-click="upvote(suggestion)"> </i>
        <br>
        {{suggestion.suggestion}}
    </div>
</div>

<div>
    <textarea ng-model="form.suggestion" placeholder="your suggestion!">
    </textarea>
    <br>
    <div class="btn_black"
        ng-click="postClicked()">
        <i class="icon-plus-squared"> </i> Post
    </div>
</div>
