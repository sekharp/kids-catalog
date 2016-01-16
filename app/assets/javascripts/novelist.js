// var profile;
// var password;
//
// profile = 'customer_profile_here';
// password = 'customer_password_here';
// /*NoveList will need to configure your profile in order to use siteTokens*/
// siteToken = 'site_token_here';
//
// if(profile === 'customer_profile_here' || password === 'customer_password_here' || siteToken ==='site_token_here') {
//     alert('please use the profile/password/siteToken provided');
// }
// else {
//
//     /**********actual API call **************/
//
//     /* this example includes an optional site identifer.*/
//     /*nothing is being done in the callback function*/
//     novSelect.loadContentForQuery({ClientIdentifier:'123', ISBN:'9780439358064', version:      '2.1', siteIdentifier: siteToken} , profile, password, function(d){});
//}
////////////////////////////////////////////////////////////////////////////////

// $(document).ready(function() {
//   makeAjaxCall();
// });
//
// function makeAjaxCall() {
//   return novSelect.loadContentForQuery({ClientIdentifier:'123', ISBN:'9780439358064', version: '2.1'} , 'ns249341.main.novselcsc', ENV["NOVELIST_PASSWORD"], function(d){ debugger; console.log('success', d)});
// }
