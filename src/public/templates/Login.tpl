<div class="row  pt4">
    <div class="section small-12">
        <h1 class="title  fwb  mb1  text-center">LOGIN</h1>
    </div>
</div>

<section class="row">
    <div class="center  small-10  medium-6 large-4 ">
        <div class="fieldWrapper">
            <input ng-model="form.email" placeholder="email" type="email"/>
            <input ng-model="form.password" placeholder="password" type="password"/>
            <button class="btn--secondary btn--medium btn--expanded  "
                    ng-click="login()">
                LOGIN
            </button>

            <div class="mb"></div>

            <button class="icon-edit  btn--primary  btn--medium  btn--expanded"
                    ng-click="navigateToRegisterUser()">
                USER REGISTRATION
            </button>
        </div>
    </div>
</section>
