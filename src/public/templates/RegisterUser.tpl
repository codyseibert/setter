<div class="btn_black"
    ng-click="back()">
    <i class="icon-left-big"> </i>Back
</div>

<div class="title">Register User</div>

<div class="error mb"
        ng-show="error">
    {{error}}
</div>

<input ng-model='form.email' placeholder="email" /><br>
<input ng-model='form.password' placeholder="password" /><br>
<input ng-model='form.firstname' placeholder="first name" /><br>
<input ng-model='form.lastname' placeholder="last name" /><br>
<div class="btn_black"
        ng-click='registerClicked()'>
    <i class="icon-plus-squared"> </i>Register
</div>
