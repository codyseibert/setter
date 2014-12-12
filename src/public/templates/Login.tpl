<div class="title">LOGIN</div>

<input ng-model="form.email" placeholder="email"/>
<br>
<input ng-model="form.password" placeholder="password"/>
<br>
<div class="btn_green"
        ng-click="login()">
    <i class="icon-key"> </i>LOGIN
</div>

<div class="mb"></div>

<div class="btn_black"
        ng-click="navigateToRegisterUser()">
    <i class="icon-plus-squared"> </i>USER REGISTER
</div>

<div class="mb"></div>

<div class="btn_black"
        ng-click="navigateToRegisterGym()">
    <i class="icon-plus-squared"> </i>GYM REGISTER
</div>
