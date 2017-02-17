// let token = null,
//     crier;

// let Crier = function() {
//   this.cries = {};

//   $('#crier').remove();
//   this.container = $('<div id="crier"></div>');
//   this.container.append('<ul class="cries"></ul>');
//   $('body').append(this.container);
// };

// Crier.prototype.add = function(cry) {
//   this.cries[cry.id] = cry;
//   this.drawCries();
// };

// Crier.prototype.drawCries = function() {
//   let criesUl = this.container.find('ul.cries');

//   criesUl.empty();

//   for(let key in this.cries) {
//     let cry = this.cries[key];
//     criesUl.append('<li class="cry">' + cry.message + '</li>');
//   }
// };

// function renderGames(games) {
//   let container = $('#games ul');

//   container.empty();
//   for(let i = 0; i < games.length; i++) {
//     container.append('<li>' + games[i] + '</li>');
//   }
// }

// function drawGams() {
//   let container = $('#games'), gamesLink, gamesUrl;

//   if(!token){
//     container.hide();
//     return false;
//   }

//   container.show();

//   gamesLink = container.find('.gams-link');
//   gamesUrl = gamesLink.attr('href');

//   console.log(gamesLink);

//   gamesLink.off().on('click', function(event){
//     event.preventDefault();
//     $.ajax({
//       url: gamesUrl,
//       type: 'GET',
//       beforeSend: function(xhr){
//         xhr.setRequestHeader('Authorization', 'Bearer ' + token);
//       },
//       success: function(data) {
//         renderGames(data);
//       },
//       error: function(xhr) {
//         if(xhr.status === 401) {
//           crier.add({message: 'Not authenticated', id: 'games'});
//         }else{
//           crier.add({message: 'Something went wrong', id: 'games'});
//         }
//       }
//     });
//   });
// }


// $(document).ready(function(){
//   let form = $('.log-in');

//   crier = new Crier();

//   drawGams();

//   form.on('ajax:success', function(_event, data){
//     token = data.jwt;
//     drawGams();
//     crier.add({message: 'Successful login', id: 'login-form'});
//   }).on('ajax:error', function(_event, ajax){
//     token = null;
//     drawGams();
//     if(ajax.status === 404){
//       crier.add({message: 'Unable to login', id: 'login-form'});
//     }
//   });
// });
