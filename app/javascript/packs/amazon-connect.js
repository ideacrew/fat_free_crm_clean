import "amazon-connect-streams";

const instanceURL = "https://demo-covid.awsapps.com/connect/ccp-v2";
// const instanceURL = "https://demo-covid.awsapps.com/connect/ccp#";

const containerDiv = document.querySelector("#containerDiv");

connect.core.initCCP(containerDiv, {
  ccpUrl: instanceURL,      /*REQUIRED*/
  loginPopup: true,      /*optional, default TRUE*/
  region: "us-east-1",      /*REQUIRED for chat, optional otherwise*/
  softphone: {        /*optional*/
    allowFramedSoftphone: true,  /*optional*/
    disableRingtone: false,    /*optional*/
    ringtoneUrl: "./ringtone.mp3"  /*optional*/
  }
});