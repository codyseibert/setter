

<div class="row  pt4">
  
  <div class="section small-12">
    <h1 class="title  fwb  mb1  text-center">LOGIN</h1>
  </div>
</div>
<section class="row">
  <div class="center  small-10  medium-6 large-4 ">
    <div class="fieldWrapper">
    <input class="" ng-model="form.email" placeholder="email" type="email"/>
    <input class="" ng-model="form.password" placeholder="password" type="password"/>
    <button class="btn--secondary btn--medium btn--expanded  "
            ng-click="login()">
        LOGIN
    </button>

    <div class="mb"></div>

    <button class="btn--primary  btn--medium  btn--expanded"
            ng-click="navigateToRegisterUser()">
        USER REGISTER
    </button>
    </div>
  </div>
</section>

<!--
<div class="mb"></div>

<div class="btn_black"
        ng-click="navigateToRegisterGym()">
    <div class="right">GYM REGISTER</div>
    <i class="icon-plus-squared"> </i>
</div>
-->
