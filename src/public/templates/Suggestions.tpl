<section class="row">
    <div class="small-12 columns header">
        <div class="left">
            <button class="[ btn--secondary btn--medium right ] icon-left-big"
                ng-click="back()" >
                Back
            </button>
        </div>
    </div>

    <div class="small-12 columns">
        <h1 class="icon-megaphone"> Feedback</h1>
    </div>
</section>

<section class="row">
    <div class="small-12 columns">
        <ul class="list--tableStyle">
            <li ng-repeat="suggestion in suggestions" class="list--tableStyle  ptb2">
                {{suggestion.suggestion}}
                <br>
                <i class="icon-thumbs-up-alt suggestion"
                    ng-class="{disabled: suggestion.disabled}"
                    ng-style="{'font-size': getFontSize(suggestion) + 'px'}"
                    ng-click="upvote(suggestion)"> </i>{{suggestion.upvotes}}
            </li>
        </ul>
    </div>
</section>

<section class="row">
    <div class="small-12 columns">
        <textarea
            ng-model="form.suggestion"
            type="text"
            placeholder="your suggestion!">
        </textarea>

        <button class="btn--medium btn--primary icon-plus-squared btn--expanded"
                ng-click="postClicked()">
            Post Feedback
        </button>
    </div>
</section>
