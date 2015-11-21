//= require freshdesk.turbolinks

!function(){function i(a){try{return a()}catch(b){window.console&&window.console.log&&window.console.log.apply&&window.console.log("Freshdesk Error: ",b)}}function k(b){return b&&!c.test(b)?a.location.protocol+"//"+b:b}function l(b){var c=a.createElement("link");c.setAttribute("rel","stylesheet"),c.setAttribute("type","text/css"),c.setAttribute("href",b),"undefined"!=typeof c&&a.getElementsByTagName("head")[0].appendChild(c)}function m(b){var c=a.createElement("script");c.setAttribute("type","text/javascript"),c.setAttribute("src",b),"undefined"!=typeof c&&a.getElementsByTagName("head")[0].appendChild(c)}function n(a,b,c){a&&a.addEventListener?a.addEventListener(b,c,!1):a&&a.attachEvent&&a.attachEvent("on"+b,c)}function o(a){var b;for(b in a)f.hasOwnProperty(b)&&("url"===b||"assetUrl"===b?f[b]=k(a[b]):f[b]=a[b])}function p(b){var c=b.src,d=window.navigator&&window.navigator.appVersion.split("MSIE"),e=parseFloat(d[1]);return e>=5.5&&7>e&&a.body.filters&&(b.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+c+"', sizingMethod='crop')"),b}function q(){null==$widget_attr.button&&"popup"==f.widgetType&&(class_name=b[f.alignment]||"left",$widget_attr.button=a.createElement("div"),$widget_attr.button.setAttribute("id","freshwidget-button"),$widget_attr.button.style.display="none",$widget_attr.button.className="freshwidget-button fd-btn-"+class_name,j.Version()<=10&&($widget_attr.button.className+=" ie"+j.Version()),link=a.createElement("a"),link.setAttribute("href","javascript:void(0)"),text=null,proxyLink=a.createElement("a"),proxyLink.setAttribute("href","javascript:void(0)"),null==f.backgroundImage||""==f.backgroundImage||"text"==f.buttonType?(link.className="freshwidget-theme",link.style.color=f.buttonColor,link.style.backgroundColor=f.buttonBg,link.style.borderColor=f.buttonColor,proxyLink.className="proxy-link",text=a.createTextNode(f.buttonText)):(link.className="freshwidget-customimage",text=a.createElement("img"),text.src=f.backgroundImage,text.alt=f.buttonText,text=p(text)),"top"==class_name||"bottom"==class_name?$widget_attr.button.style.left=f.offset:$widget_attr.button.style.top=f.offset,a.body.insertBefore($widget_attr.button,a.body.childNodes[0]),$widget_attr.button.appendChild(link),link.appendChild(text),(null==f.backgroundImage||""==f.backgroundImage)&&j.Version()<=10&&($widget_attr.button.appendChild(proxyLink),n(proxyLink,"click",function(){window.FreshWidget.show()}),proxyLink.style.height=link.offsetHeight+"px",proxyLink.style.width=link.offsetWidth+"px"),n(link,"click",function(){window.FreshWidget.show()}))}function r(){null!=$widget_attr.button&&(a.body.removeChild($widget_attr.button),$widget_attr.button=null)}function s(){null!=$widget_attr.container&&(a.body.removeChild($widget_attr.container),$widget_attr.container=null)}function t(){null==$widget_attr.container&&($widget_attr.container=a.createElement("div"),$widget_attr.container.className="freshwidget-container",$widget_attr.container.id="FreshWidget",""==f.responsive&&($widget_attr.container.className+=" responsive"),$widget_attr.container.style.display="none",a.body.insertBefore($widget_attr.container,a.body.childNodes[0]),$widget_attr.container.innerHTML='<div class="widget-ovelay" id="freshwidget-overlay">&nbsp;</div><div class="freshwidget-dialog" id="freshwidget-dialog"> <img alt="Close Feedback Form" id="freshwidget-close" class="widget-close" src="'+f.assetUrl+"/widget_close.png?ver="+d+'" /><div class="mobile-widget-close" id="mobile-widget-close"></div> <div class="frame-container">  <iframe title="Feedback Form" id="freshwidget-frame" src="about:blank" frameborder="0" scrolling="auto" allowTransparency="true" style="height: '+f.formHeight+'"/> </div>',$widget_attr.container=a.getElementById("FreshWidget"),$widget_attr.closeButton=a.getElementById("freshwidget-close"),$widget_attr.closeButton=p($widget_attr.closeButton),$widget_attr.mobileCloseButton=a.getElementById("mobile-widget-close"),$widget_attr.dialog=a.getElementById("freshwidget-dialog"),$widget_attr.iframe=a.getElementById("freshwidget-frame"),$widget_attr.overlay=a.getElementById("freshwidget-overlay"),$widget_attr.dialog.appendChild($widget_attr.iframe),u(),n($widget_attr.closeButton,"click",function(){window.FreshWidget.close()}),n($widget_attr.mobileCloseButton,"click",function(){window.FreshWidget.close()}),n($widget_attr.overlay,"click",function(){window.FreshWidget.close()}),n($widget_attr.iframe,"load",function(){$widget_attr.iframeLoaded||-1==$widget_attr.iframe.src.indexOf("/widgets/feedback_widget/new?")||($widget_attr.iframeLoaded=!0)}))}function u(){$widget_attr.iframe.src=f.url+"/loading.html?ver="+d}function v(){$widget_attr.iframe.src=f.url+"/widgets/feedback_widget/new?"+f.queryString}function w(){scroll(0,0),$widget_attr.container.style.display="block",f.responsive||(e=a.body.style.overflow,a.body.style.overflow="hidden"),j.Version()>8&&""==f.screenshot&&html2canvas([a.body],{ignoreIds:"FreshWidget|freshwidget-button",proxy:!1,onrendered:function(b){var c=b.toDataURL(),d=c;sendMessage=setInterval(function(){$widget_attr.iframeLoaded&&(a.getElementById("freshwidget-frame").contentWindow.postMessage(d,"*"),clearInterval(sendMessage))},500)}}),$widget_attr.iframeLoaded||v()}function x(){$widget_attr.container.style.display="none",f.responsive||(a.body.style.overflow=e||"auto"),v()}function y(a){o(a),j.Version()>8&&"undefined"==typeof html2canvas&&""==f.screenshot&&m(f.assetUrl+"/html2canvas.js?ver="+d),n(window,"load",function(){q(),t()}),l(f.assetUrl+"/freshwidget.css?ver="+d)}function z(a){o(a),r(),s(),$widget_attr.iframeLoaded=!1,q(),t()}function A(){r(),s(),delete window.FreshWidget}var e,a=window.document,b={1:"top",2:"right",3:"bottom",4:"left",top:"top",right:"right",bottom:"bottom",left:"left"},c=/^[a-zA-Z]+:\/\//,d=2,f={widgetId:0,buttonText:"Support",buttonBg:"#7eb600",buttonColor:"white",backgroundImage:null,alignment:"left",offset:"35%",url:"http://support.freshdesk.com",assetUrl:"https://s3.amazonaws.com/assets.freshdesk.com/widget",queryString:"",screenshot:"",formHeight:"500px",responsive:"",widgetType:"popup",buttonType:"text"};$widget_attr={button:null,dialog:null,container:null,overlay:null,iframe:null,iframeLoaded:!1,closeButton:null,mobileCloseButton:null};var j={Version:function(){var a=999;return-1!=navigator.appVersion.indexOf("MSIE")&&(a=parseFloat(navigator.appVersion.split("MSIE")[1])),a}},B={init:function(a,b){i(function(){return y(b)})},show:function(){i(function(){return w()})},close:function(){i(function(){return x()})},iframe:function(){return $widget_attr.iframe},update:function(a){i(function(){return z(a)})},destroy:function(){i(function(){return A()})}};window.FreshWidget||(window.FreshWidget=B)}();