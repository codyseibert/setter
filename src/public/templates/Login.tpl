<div class="row  pt4">

    <div class="section small-12">
        <h1 class="title  fwb  mb1  text-center">LOGIN</h1>
    </div>

</div>


<section class="row">

    <div class="center  small-10  medium-6 large-4 ">

        <div class="fieldWrapper  mb4">

            <div ng-show="error"
                style="color: red; text-align: center; margin-top: 20px; margin-bottom: 20px;">
                {{error}}!
            </div>

            <input ng-model="form.email" placeholder="email" type="email"/>

            <input ng-model="form.password" placeholder="password" type="password"/>

            <button class="btn--secondary btn--medium btn--expanded   "
                    ng-click="login()">
                LOGIN
            </button>
            
        </div>

        <div class="fieldWrapper mb4  text-center">

            <label for="" class="fwb  label--inline  mb0 ">Have an access key?</label>

            <button class="icon-edit  btn--primary  btn--medium  btn--expanded"
                    ng-click="navigateToRegisterUser()">
                Register Here
            </button>
        </div>
        
        <div class="text-center">
            <a for="" class="text-center  fwb "  ng-click="navigateToRegisterGym()">Climbing Gym? <br>Request an account here</a>
        </div>
</section>
