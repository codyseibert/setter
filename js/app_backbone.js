// Foundation JavaScript
// Documentation can be found at: http://foundation.zurb.com/docs


var setupApp = function(){ 

    var switchMainSection = function(templateName){
        console.log(templateName);
        $(".main-section").html($(templateName).html());
        //Pizza.init();
        $(document).foundation();
        //Custom Dropdown Button Code
        $('a, button, [data-action="toggle-dropDown"] ').click(function(){ 
            Foundation.libs.dropdown.close($('[data-ui-component="dropDown"]'));
        });  
    };
    
    var AppRouter = Backbone.Router.extend({ 
        routes:{
            "": "default",
            "gyms/:id/dashboard": "showGymDashboard",
            "gyms/:id/manageWalls": "showGymManageWalls",
            "gyms/:id/setters": "showGymSetters",
            "gyms/insights": "showGymInsights",
            "gyms/topo": "showGymTopo",
            "gyms/routeArchive": "showGymRouteArchive",            
            "gyms/account/settings": "showGymAccountSettings",
            "gyms/:gymId/manage/walls/:wallId": "showGymManageWall",
            "gyms/manage/walls/route": "showGymManageRoute",
            "gyms/view/profile": "showGymProfile",
            "user/profile": "showUserProfile",
            "user/accountsettings": "showUserAccountSettings",
            "user/gymsearch": "showUserGymSearch",
            "user/sentroutes": "showUserSentRoutes"
        },

        default: function(){
            switchMainSection("#template_gym_dashboard");
        },

        showGymDashboard: function(gymId){
            switchMainSection("#template_gym_dashboard");








            var WallRating = Backbone.Model.extend({
                defaults: {
                    name: "",
                    rating: 5
                },
                initialize: function(){
                }
            });

            var WallRatingView = Backbone.View.extend({
                template: _.template($("#template_gym_dashboard_wall_rating").html()),
                
                tagName: "li",
                className: "list--stats-elem",

                initialize: function(){ 
                    this.model.on("change", this.render, this); 
                },

                render: function(){ 
                    this.$el.html(this.template(this.model.toJSON()) );
                    return this;
                }
            });

            var WallRatings = Backbone.Collection.extend({
                model: WallRating,
                url: "api/gyms/"+gymId+"/insights/performance"
            });

            var WallRatingsView = Backbone.View.extend({ 
                initialize:function () { 
                    this.collection.on("add", this.addOne, this);  
                },

                addOne: function(wallRating){  
                    var wallRatingView = new WallRatingView({
                        model: wallRating,
                        collection : this.collection
                    });
                    wallRatingView.render();
                    this.$el.append(wallRatingView.el);
                },

                render:function (eventName){

                }
            }); 

            var boulderingRatings = new WallRatings();
            boulderingRatings.url += "/bouldering";
            var boulderingRatingsView = new WallRatingsView({
                el: $("[data-ui-component='bouldering_ratings']")[0],
                collection: boulderingRatings
            });
            boulderingRatings.fetch();

            var leadRatings = new WallRatings();
            leadRatings.url += "/lead";
            var leadRatingsView = new WallRatingsView({
                el: $("[data-ui-component='lead_ratings']")[0],
                collection: leadRatings
            });
            leadRatings.fetch();

            var topropeRatings = new WallRatings();
            topropeRatings.url += "/toprope";
            var topropeRatingsView = new WallRatingsView({
                el: $("[data-ui-component='toprope_ratings']")[0],
                collection: topropeRatings
            });
            topropeRatings.fetch();

            var RouteInsights = Backbone.Model.extend({
                defaults: [],
                initialize: function(){

                },
                urlRoot: ""
            }); 
  
            var RouteInsightsView = Backbone.View.extend({
                template: _.template($("#template_gym_dashboard_chart").html()),

                initialize: function(){ 
                    this.model.on("change", this.render, this); 
                },

                render: function(){ 
                    this.$el.html(this.template( { action: this.model.toJSON() } ));
                    Pizza.init();
                    return this;
                }
            }); 

            var insights = new RouteInsights();
            var chartView = new RouteInsightsView({
                el: $("[data-bar-id='currentGymRoutes']")[0],
                model: insights
            });

            var loadGraph = function(type){
                insights.urlRoot = "api/gyms/"+gymId+"/insights/count/" + type;
                insights.clear().set(insights.defaults);
                insights.fetch();
            };

            $("#type_select").change(function(){
                var type = $("#type_select").val();
                console.log(type);
                loadGraph(type);
            });
            $("#type_select").change();
        },

        showGymManageWalls: function(gymId){
            switchMainSection("#template_gym_manage_walls");

            var Wall = Backbone.Model.extend({
                defaults: {
                    name: "",
                },
                initialize: function(){

                },
                urlRoot: "api/gyms/"+gymId+"/walls"
            });


            var Walls = Backbone.Collection.extend({
                model: Wall,
                url: "api/gyms/"+gymId+"/walls"
            }); 

            var WallView = Backbone.View.extend({
                template: _.template($("#template_gym_manage_walls_wall").html()),
                
                tagName: "li",
                className: "wall",
                attributes: {
                    "data-ui-component": "wall"
                },

                initialize: function(){ 
                    this.model.on("change", this.render, this); 
                },

                render: function(){ 
                    this.$el.html(this.template(this.model.toJSON()) );
                    return this;
                }
            });

            var WallsView = Backbone.View.extend({ 
                initialize:function () { 
                    this.collection.on("add", this.addOne, this);  
                },

                addOne: function(wall){  
                    var wallView = new WallView({
                        model: wall,
                        collection : this.collection
                    });
                    wallView.render();
                    this.$el.append(wallView.el);
                },

                render:function (eventName){

                }
            }); 
 
            var walls = new Walls();
            var wallsView = new WallsView({
                el: $("[data-ui-component='wallsList'] .list--tableStyle")[0],
                collection: walls
            });
            walls.fetch();

            $("#addZoneForm").submit(function(e){
                e.preventDefault();
                var name = $("#addZoneForm input[name='name']").val();
                  
                var data = {
                    "name": name
                };
                var wall = new Wall(data);
                wall.save(null, {
                    success: function(model, response){ 
                        walls.add(model);
                    }
                });

                $("#addZone").hide(); 
            });

        },

        showGymManageWall: function(gymId, wallId){
            switchMainSection("#template_gym_manage_wall");
        },

        showGymManageRoute: function(){
            switchMainSection('#template_gym_manage_route');
        },  

        showGymSetters: function(gymId) {
            switchMainSection("#template_gym_setters");

            var Setter = Backbone.Model.extend({
                defaults: {
                    firstname: "",
                    lastname: ""           
                },
                initialize: function(){

                },
                urlRoot: "api/gyms/"+gymId+"/setters"
            });


            var Setters = Backbone.Collection.extend({
                model: Setter,
                url: "api/gyms/"+gymId+"/setters"
            }); 

            var SetterView = Backbone.View.extend({
                template: _.template($("#template_gym_setters_setter").html()),
                
                tagName: "li",
                className: "gridRow--oneThird",
                attributes: {
                    "data-ui-component": "setter"
                },

                initialize: function(){ 
                    this.model.on("change", this.render, this); 
                },

                render: function(){ 
                    this.$el.html(this.template(this.model.toJSON()) );
                    return this;
                }
            });

            var SettersView = Backbone.View.extend({ 
                initialize:function () { 
                    this.collection.on("add", this.addOne, this);  
                },

                addOne: function(setter){
                    var setterView = new SetterView({
                        model: setter,
                        collection : this.collection
                    });
                    setterView.render();
                    this.$el.append(setterView.el);
                },

                render:function (eventName){

                }
            }); 

            var setters = new Setters([
                {"firstname" : "Cody", "lastname": "Seibert"},
                {"firstname" : "Cody", "lastname": "Seibert"},
                {"firstname" : "Cody", "lastname": "Seibert"}
            ]);
            var setters = new Setters();
            var settersView = new SettersView({
                el: $("[data-ui-component='settersList']")[0],
                collection: setters
            });
            setters.fetch();

            $("#addSetterForm").submit(function(e){
                e.preventDefault();

                var firstname = $("#addSetterForm input[name='firstname']").val();
                var lastname = $("#addSetterForm input[name='lastname']").val();
                
                console.log(firstname, lastname);

                var data = {
                    "firstname": firstname,
                    "lastname": lastname
                }
                var setter = new Setter(data);
                setter.save();
                settersView.addOne(setter);

                $("#addSetter").hide(); 
            });
        },

        showGymInsights: function () { 
            switchMainSection("#template_gym_insights");
            //
            //Below is my failed attempt at trying to get pizza to work for this page
            // :( 
            // var GymInsights = Backbone.Model.extend({
            //     defaults: [],
            //     initialize: function(){

            //     },
            //     urlRoot: "api/gyms/"+gymId+"/insights"
            // }); 
  
            // var GymInsightsView = Backbone.View.extend({
            //     template: _.template($("#template_gym_insights").html()),

            //     initialize: function(){ 
            //         this.model.on("change", this.render, this); 
            //     },

            //     render: function(){ 
            //         this.$el.html(this.template( { action: this.model.toJSON() } ));
            //         Pizza.init();
            //         Pizza.init();
            //         return this;
            //     }
            // }); 
 
            // var insights = new GymInsights();
            // var chartView = new GymInsightsView({
            //     el: $("[data-bar-id='gymHistoryGraph']")[0],
            //     model: insights
            // });
            // insights.fetch(); 
        },

        showGymTopo: function(){
            switchMainSection("#template_gym_topo");
        },

        showGymRouteArchive: function(){
            switchMainSection("#template_gym_route_archive");
        },

        showGymAccountSettings: function(){
            switchMainSection("#template_gym_account_settings");

            $('[data-action="showGymProfile"]').click(function() {
                switchMainSection("#template_gym_view_profile");
            });
        },
        
        showGymProfile: function() {
            switchMainSection("#template_gym_view_profile");
        },

        showUserProfile: function() {
            switchMainSection("#template_user_profile");
        },

        showUserAccountSettings: function() {
            switchMainSection("#template_user_accountsettings");
        },
        showUserGymSearch: function() {
            switchMainSection("#template_user_gymsearch");

            // var = gyms = [
            //     {gymName: "Aiguille", gymLocation: "Longwood, Fl"}
            //     {gymName: "Bouldering Boulders", gymLocation: "Nevgas, Fl"}
            // ]

            // var ListView = Backbone.View.extend({
            //     tagName = "ul",

            //     render: function() {
            //         var self = this; 

            //         _.each(self.collection, function(gym) {
            //             $(self.el).append(
                            

            //                 )
            //         })
            //     }
            // })
        },
        showUserSentRoutes: function() {
            switchMainSection("#template_user_sentroutes");
        }
    });

    var app = new AppRouter();
    Backbone.history.start(); 
};
