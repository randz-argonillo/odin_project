
// var Person = function(config){
//   this.name = config.name;
//   this.age = config.age;
//   this.occupation = config.occupation;
// }

// Person.prototype.work = function(){
//   return this.name + ' is working.'
// }

var Person = Backbone.Model.extend({
  defaults: {
    name: 'Person name',
    age: 18,
    occupation: 'Your occupation'
  },

  validate: function(attributes) {
    if ( attributes.age < 0 ) {
      return 'Age must be positive.';
    }

    if ( !attributes.name ) {
      return 'Every person must have a name.';
    }
  },

  work: function(){
    return this.get('name') + ' is working'
  }

});



 // validate: function(attribute){
 //    if(attribute.age < 0){
 //      return 'Age must be positive';
 //    }

 //    if(attribute.name == null){
 //      return 'Please provide a name';
 //    }
 //  },