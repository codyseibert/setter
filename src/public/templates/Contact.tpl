<div class="mb"></div>
<div class="btn_black small"
    ng-click="back()">
    <i class="icon-left-big"> </i>Back
</div>
<div class="mb"></div>


<div class="title">Contact Us</div>

<div class="mb" ng-show="thanks && !error">
    <span class="yellow">Thank you</span> for your message!
</div>

<div class="mb" ng-show="error" class="red">
    There was an error posting your message =(
</div>

<div ng-hide="thanks">
    <input ng-model="form.name"
        placeholder="email or name"
        autocorrect="off"
        autocapitalize="off">
    </input>

    <div class="mb"></div>

    <textarea ng-model="message"
        placeholder="What's on your mind?!"
        class="contact">
    </textarea>

    <div class="mb"></div>

    <div class="btn_black"
            ng-click="send()" >
        <i class="icon-plus-squared"> </i>Send
    </div>
</div>
