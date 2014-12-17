// Foundation JavaScript
// Documentation can be found at: http://foundation.zurb.com/docs
$(document).foundation();

            var setupNavigation = function(){

                //Account Login Dropdown Button Code
                $('[data-action="open-account-dropDown"]').click(function(e){
                    var leftOffset = $(e.target).offset().left;
                    var $dropDown = $('[data-ui-component="account-dropDown"]');

                    if (! $dropDown.hasClass('is-visible')
                        && ! $dropDown.hasClass('is-visibleOnMobile')
                        && $dropDown.css("maxWidth") == "300px" ){
                        $dropDown.addClass('is-visible').css({left: leftOffset-260});
                    }else if ($dropDown.css("maxWidth") == "600px"
                        && ! $dropDown.hasClass('is-visibleOnMobile')){
                        $dropDown.addClass('is-visibleOnMobile').css({ left: 10});
                    }else{
                        $dropDown.removeClass('is-visibleOnMobile').css({ left: -9999 });
                        $dropDown.removeClass('is-visible').css({ left: -9999 });
                    }
                });

                //Account Navigation Slider Code
               $("[data-action='open-nav-account']" || "[data-action='open-nav-account'] a").on('click',  function() {
                    var $mainSection = $('[data-ui-component="main-wrap"]');
                     if(!$mainSection.hasClass('is-open')) {
                        $mainSection.addClass('is-open');
                    } else {
                        $mainSection.removeClass('is-open');
                    }
                });

                //Code for closing Account Nav and Drop Down when clicking outside//
                $(document).click(function(event) {

                    var $mainSection = $('[data-ui-component="main-wrap"]'),
                        $dropDown = $('[data-ui-component="account-dropDown"]');

                    //Closes Account Settings dropDown when clicking child links and
                    //outside of dropDown
                    if ($dropDown.hasClass('is-visible') || $dropDown.hasClass('is-visibleOnMobile') ) {
                        if($(event.target).is('a')) {
                            $dropDown.removeClass('is-visibleOnMobile').css({ left: -9999 });
                            $dropDown.removeClass('is-visible').css({ left: -9999 });
                        }
                        else if(!$(event.target).parents('[data-action="open-account-dropDown"]')[0]) {
                            $dropDown.removeClass('is-visibleOnMobile').css({ left: -9999 });
                            $dropDown.removeClass('is-visible').css({ left: -9999 });
                        }
                    }

                    //Closes Account Nav When Cliking Outside or //links
                    if($mainSection.hasClass('is-open')) {
                        if($(event.target).parents('.nav-primary').length === 0 || $(event.target).is('a'))
                         {
                            $mainSection.removeClass('is-open');
                        }
                    }
                });

            }

$(document).ready(function() {

  setupNavigation();

});
