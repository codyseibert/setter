<section class="header row small-collapse">
    <div class="left mt1">
        <button class="[ btn--secondary btn--medium right ] icon-left-big"
            ng-click="back()" >
            Back
        </button>
    </div>

    <div class="small-12 columns">
        <h1 class="title">Suggestions</h1>
    </div>
</section>

<section class="row">
    <div class="small-12 columns">
        <ul class="list--tableStyle">
            <li ng-repeat="suggestion in suggestions" class="list--tableStyle  ptb2">
                <i class="icon-thumbs-up-alt suggestion"
                    ng-class="{disabled: suggestion.disabled}"
                    ng-style="{'font-size': getFontSize(suggestion) + 'px'}"
                    ng-click="upvote(suggestion)"> </i>{{suggestion.upvotes}}
                <br>
                {{suggestion.suggestion}}
            </li>
        </ul>
    </div>
</section>

<section class="row">
    <div class="small-12 columns">
        <div class="media--fl">
            <textarea ng-model="form.suggestion"
                        type="text"
                        placeholder="your suggestion!">
            </textarea>

            <button class="btn--medium icon-plus-squared btn--primary "
                        ng-click="postClicked()">
                Post
            </button>
        </div>
    </div>
</section>
