<section class="row">
    <div class="small-12 columns header" ng-hide="getAccountId() === gymId">
        <div class="left">
            <button class="[ btn--secondary btn--medium right ] icon-left-big"
                ng-click="back()" >
                Back
            </button>
        </div>
    </div>
</section>

<section class="row">
    <div class="center  small-10  medium-6 large-4 ">

        <h1 class="icon-edit"> User Registration</h1>

        <input ng-model='form.email' placeholder="email" type="email" /><br>
        <input ng-model='form.password' placeholder="password" type="password" /><br>
        <input ng-model='form.firstname' placeholder="first name" type="text" style="text-transform: capitalize;"/><br>
        <input ng-model='form.lastname' placeholder="last name" type="text" style="text-transform: capitalize;"/><br>
        <input ng-model='form.beta' placeholder="beta key" type="text" /><br>

        <div ng-show="error"
            style="color: red; text-align: center; margin-bottom: 40px;">
            {{error}}!
        </div>

        <button class=" [ btn--primary  btn--medium btn--expanded ]  icon-plus-squared"
            ng-click='registerClicked()'>
            Register
        </button>
    </div>
</section>
