<section class="row">
    <div class="small-12 columns header">
        <h1 class="icon-attention"> Alerts</h1>
    </div>
</section>

<section class="row">
    <div class="small-12 columns">
        <input type="text"
                placeholder="your alert for users"
                ng-model="form.message"></input>
            <button class="btn--primary  btn--medium  btn--expanded icon-paper-plane"
                ng-click="postAlert()">
            Post Alert
        </button>

        <h2>Old Alerts</h2>
        <div ng-repeat="alert in alerts">
            <h4>{{alert.message}}</h4>
            <h4>{{alert.date}}</h4>
            <button class="btn--secondary btn--medium icon-trash" ng-click="delete(alert)">
                Delete
            </button>
        </div>
    </div>
</section>
