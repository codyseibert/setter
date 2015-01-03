

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

    <div class="small-12 columns  mb4">

        <ul class="list--tableStyle">
            <li ng-repeat="suggestion in suggestions" class="list--tableStyle  ptb2">
                {{suggestion.suggestion}}
                <br>
                <i class="icon-thumbsUp  suggestion"
                    ng-class="{disabled: suggestion.disabled}"
                    ng-style="{'font-size': getFontSize(suggestion) + 'px'}"
                    ng-click="upvote(suggestion)"> </i>{{suggestion.upvotes}}
            </li>
        </ul>

    </div>

</section>


<section class="row">
    <div class="small-12   large-6  columns">
        <h2>Post Feedback</h2>
        <textarea class="textarea--small"
            ng-model="form.suggestion"
            type="text"
            placeholder="Let us know of any features or improvements you'd like to see!">
        </textarea>

        <button class="btn--medium btn--primary icon-plus  btn--expanded"
                ng-click="postClicked()">
            Post
        </button>
    </div>
</section>
