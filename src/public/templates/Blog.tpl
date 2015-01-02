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
        <h1 class="icon-rss"> Development Blog</h1>
    </div>

</section>

<section class="row mb4">
    <div class="small-12 columns">
        <textarea ng-model="new_html" placeholder="html">
        </textarea>
        <button ng-click="post()"
            class="[ btn--secondary  btn--medium  btn--expanded ] center icon-paper-plane-empty">
            Post
        </button>
    </div>
</section>

<section class="row">
    <div class="small-12 columns">
        <div class="post"
            ng-repeat="post in posts"
            style="margin-bottom: 30px;">

            <textarea ng-show="post.isEditMode"
                ng-model="post.edit_html"
                style="display: block; height: 200px;">
            </textarea>

            <div ng-hide="post.isEditMode"
                class="body"
                ng-bind-html="post.html">
            </div>

            <!-- Admin Buttons -->
            <button ng-show="isAdmin() && !post.isEditMode"
                ng-click="edit(post)">
                Edit
            </button>

            <button ng-show="post.isEditMode"
                    ng-click="save(post)">
                Save
            </button>

            <button ng-show="post.isEditMode"
                    ng-click="cancel(post)">
                Cancel
            </button>
        </div>
    </div>
</section>
