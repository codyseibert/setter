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
        <h1 class="icon-mail-alt"> Contact Us</h1>

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
                autocapitalize="off"
                type="text">
            </input>

            <textarea ng-model="form.message"
                placeholder="What's on your mind?!"
                class="contact">
            </textarea>

            <button class=" [ btn--primary  btn--medium btn--expanded ]  icon-plus-squared"
                    ng-click='send()'>
                Send
            </button>
        </div>
    </div>
</section>
