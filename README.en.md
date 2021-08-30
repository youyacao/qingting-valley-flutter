#Dragonfly V system fluent version front end
####Introduction
Dragonfly V social chat im · short video live broadcast system. Dragonfly V system is the latest product released in June 2021. Dragonfly V system is a product integrating four core functions: social chat, Im, short video and live broadcast. It is suitable for enterprises and institutions on a comprehensive application platform., Dragonfly system is gradually fully open source. If it is helpful to you, I hope to give a little star encouragement. Thank you for your support.
####Dragonfly series software architecture
vue + nuve +uniapp +flutter + java + php +laravel
node.js +springboot2.2+springmvc+druid+mybatis+mangoDB+mysql+shiro-redis+redis+activemq
This library is the dragonfly V front end. The dragonfly V front end uses the flitter
For other versions, please pay attention to the pipe network of squirrel / Dragonfly system
[squirrel short video]（ https://songshu.youyacao.com/video.html )
[Dragonfly system]（ https://songshu.youyacao.com/qingting.html )
####Installation tutorial
[Dragonfly system installation tutorial]（ https://doc.youyacao.com/web/#/8? page_ id=51)
###Dragonfly system associated warehouse
####PHP backend
[Dragonfly server Qingting API]（ https://gitee.com/youyacao/qingting-api )
[Dragonfly background management terminal Qingting admmin]（ https://gitee.com/youyacao/qingting-admin )
####Java back end
[Dragonfly server qingtingjava-s-sever]（ https://gitee.com/youyacao/qingtingjava-s-sever )
[Dragonfly background management client Qingting Java manager client]（ https://gitee.com/youyacao/qingting-java-manager-client )
####Front end and back end
[Dragonfly V system front end]（ https://gitee.com/youyacao/qingting-valley-flutter )
[Dragonfly s system front end]（ https://gitee.com/youyacao/qingting-s-uniapp )
[Dragonfly T system front end]（ https://gitee.com/youyacao/qingting-team-flutter )
[Dragonfly Q system front end]（ https://gitee.com/youyacao/qingting-queen-uniapp )
[Dragonfly f system front end]（ https://gitee.com/youyacao/qingting-f-uniapp )
####File directory description
[description of Official Directory of dragonfly system]（ https://doc.youyacao.com/web/#/8? page_ id=649)
####API interface documentation
[Click to view API interface document]（ https://doc.youyacao.com/web/#/16? page_ id=93)
[Click to view the Java API interface document]（ https://doc.youyacao.com/web/#/18? page_ id=226)
####Purchase authorization or technical support
Genuine authorized pipe network query:
[Click to query authorization and purchase other technical support services]（ https://zhengban.youyacao.com )
Official QQ exchange group: 929353806
#The following description is about TRTC in dragonfly V system
#Run through demo (fluent)
This article mainly introduces how to quickly run Tencent cloud TRTC demo (fluent).
##Environmental requirements
-Fluent version 1.12 and above
-Android Development
-Android studio 3.5 and above
-App requires Android 4.1 and above devices
-IOS development
-Xcode 11.0 and above
-Please ensure that your project has a valid developer signature set
##Preconditions
You have [registered Tencent cloud]（ https://partners.cloud.tencent.com/invitation/1000009941225fd73659498d2 ）Account number, complete real name authentication, apply to be associated with elegant grass, and become a customer through the audit of elegant grass. Customers who are not associated can enjoy the official discount of Tencent. If they are not associated, they are regarded as direct customers and do not enjoy any discount
##Operation steps
<span id="step1"></span>
###Step 1: create a new application
1. Log in to the real-time audio and video console and select [development assistance] > [quick run demo]（ https://console.cloud.tencent.com/trtc/quickstart )】。
2. Click start now, enter the application name, such as' testtrtc ', and click create application.
<span id="step2"></span>
###Step 2: Download SDK and demo source code
1. Move the mouse to the corresponding card and click [GitHub]（ https://github.com/c1avie/trtc_ [demo)] jump to GitHub and download the relevant SDK and supporting demo source code.
<img src=" https://imgcache.qq.com/operation/dianshi/other/flutterCard.e9d6e205d0e0a8903aa437602acafecb3958e0cb.png " height="400" />
2. After downloading, return to the real-time audio and video console and click [I have downloaded, next] to view the sdkappid and key information.
<span id="step3"></span>
###Step 3: configure the demo project file
1. Unzip the source package downloaded in [step 2] (#step2).
2. Find and open the ` / lib / debug / generatetestusersig. Dart 'file.
3. Set relevant parameters in the 'generatetestusersig. Dart' file:
< UL > < li > sdkappid: the default is placeholder. Please set it to the actual sdkappid</ li>
<li>Secretkey: the default is placeholder. Please set it to the actual key information</ li></ul> 
<img src=" https://imgcache.qq.com/operation/dianshi/other/flutterSercet.abb0c77a30a50a27bb36058bdabe1f051484c058.png " height="400" /> 
4. Return to the real-time audio and video console and click [paste completed, next].
5. Click Close guidance to enter console management application.
>The scheme of generating usersig mentioned in this article is to configure secretkey in the client code. In this method, secretkey is easy to be decompiled and reverse cracked. Once your key is leaked, the attacker can steal your Tencent cloud traffic. Therefore * * this method is only suitable for local running demo and function debugging * *.
>The correct way to issue usersig is to integrate the calculation code of usersig into your server and provide an app oriented interface. When usersig is required, your app initiates a request to the business server to obtain dynamic usersig. For more details, see [server generates usersig]（ https://cloud.tencent.com/document/product/647/17275#Server )。
###Step 4: compile and run
1. Execute ` fluent pub get`
2. Android debugging:
*(1) Can execute ` shutter run`
*(2) You can use Android studio (version 3.5 and above) to open the source project and click Run.
3. IOS debugging: use Xcode (version 11.0 and above) to open the / IOS project in the source directory, compile and run the demo project.
####How to view TRTC logs?
TRTC logs are compressed and encrypted by default, and the suffix is. Xlog.
*IOS: documents / log of sandbox
* Android
*Versions 6.7 and earlier: / sdcard / log / Tencent / liteav
*Versions after 6.8: / sdcard / Android / data / package name / files / log / Tencent / liteav/
####Frequently asked questions
Refer to [document] for more frequently asked questions（ https://cloud.tencent.com/document/product/647/51623 )
#####IOS cannot display video (Android is good)
Please confirm io.shutter.embedded_ views_ Preview is' yes' in your info.plist
#####Android manifest merge failed to compile
Please open the / example / Android / APP / SRC / main / androidmanifest.xml file.
1. Xmlns: Tools=“ http://schemas.android.com/tools "Join the manifest
2. Add tools: replace = "Android: label" to the application.
![ [illustration]（ https://main.qcloudimg.com/raw/7a37917112831488423c1744f370c883.png )