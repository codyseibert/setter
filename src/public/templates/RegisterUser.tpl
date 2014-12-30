<div class="mb"></div>

<div class="btn_black small"
    ng-click="back()">
    <i class="icon-left-big"> </i>Back
</div>

<div class="title">Register User</div>

<div class="error mb"
        ng-show="error">
    {{error}}
</div>

<input ng-model='form.email' placeholder="email" type="email" /><br>
<input ng-model='form.password' placeholder="password" type="password" /><br>
<input ng-model='form.firstname' placeholder="first name" style="text-transform: capitalize;"/><br>
<input ng-model='form.lastname' placeholder="last name" style="text-transform: capitalize;"/><br>
<input ng-model='form.beta' placeholder="beta key"/><br>
<div class="btn_black"
        ng-click='registerClicked()'>
    <i class="icon-plus-squared"> </i>Register
</div>
