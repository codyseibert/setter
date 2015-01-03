<section class="row">
    <div class="small-12 columns header">
        <h1 class="icon-megaphone"> Announcements</h1>
    </div>
</section>

<section class="row">
    <div class="small-12 large-6 columns  mb4">

        <textarea class="textarea--small" type="text"
                placeholder="Type an alert to send your climbers"
                ng-model="form.message"/>
            <button class="btn--primary  btn--medium  btn--expanded icon-plus"
                ng-click="postAlert()">
            Post Announcement 
        </button>

    </div>
    <div class="small-12 large-6 columns">
        <h2 class="fwb">Old Announcements</h2>
        <ul class="list list--noStyles">
            <li ng-repeat="alert in alerts">
                <h3 class="h4  mb1">{{alert.message}}</h3>
                <h4 class="h5  mb1">{{alert.date}}
                </h4>
                <a class="icon-trash display--block  h6  mb3" ng-click="delete(alert)">
                    Delete Announcement
                    </a>

            </li>
        </ul>
    </div>
</section>
