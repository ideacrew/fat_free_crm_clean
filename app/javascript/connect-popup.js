launchCCP = function() {
  var popupWindow=null;
  var windowFeatures = "menubar=no,width=320px,height=470px,toolbar=no,location=no,resizable=yes,scrollbars=no,status=no,left=800%,top=300%";
  popupWindow = windowObjectReference = window.open("/connect_streams/connect", "Amazon Connect", windowFeatures);
}
