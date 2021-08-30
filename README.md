
# 蜻蜓v系统flutter版本前端

![](https://doc.youyacao.com/server/index.php?s=/api/attachment/visitFile/sign/e7dfcfb3b64fd746bb447b68e0b8ccbd)

#### 介绍
蜻蜓V社交聊天IM·短视频直播系统，蜻蜓v系统是2021年6月最新发布产品，蜻蜓V系统是一款集合社交，聊天IM，短视频，直播四大核心功能为一体的产品，适合综合性应用平台的企事业单位采购。，蜻蜓系统逐步全面开源，如果对您有帮助，希望给个小星星鼓励，感谢支持。
#### 蜻蜓系列软件架构

vue + nuve +uniapp +flutter + java + php +laravel

node.js +springboot2.2+springmvc+druid+mybatis+mangoDB+mysql+shiro-redis+redis+activemq

此库为蜻蜓v前端，蜻蜓v前端使用flutter
 
 
 其他版本请关注松鼠/蜻蜓系统管网 

[松鼠短视频](https://songshu.youyacao.com/video.html)
[蜻蜓系统](https://songshu.youyacao.com/qingting.html)


#### 产品截图
![](https://doc.youyacao.com/server/index.php?s=/api/attachment/visitFile/sign/fae67cf7c61de6a651618931b9b03101)

![](https://doc.youyacao.com/server/index.php?s=/api/attachment/visitFile/sign/6703949e3a441aa2dfc2cb6578caca31)

![](https://doc.youyacao.com/server/index.php?s=/api/attachment/visitFile/sign/b2a2128ce1339572237b3db0afb2c8b6)

![](https://doc.youyacao.com/server/index.php?s=/api/attachment/visitFile/sign/1f476e8820d4ed0347582db714dd9d1c)

#### 安装教程

[蜻蜓系统整体安装教程](https://doc.youyacao.com/web/#/8?page_id=51)


### 蜻蜓系统关联仓库

#### PHP后端

[蜻蜓服务端qingting-api](https://gitee.com/youyacao/qingting-api)
[蜻蜓后台管理端qingting-admmin](https://gitee.com/youyacao/qingting-admin)

#### JAVA后端

[蜻蜓服务端qingtingjava-s-sever](https://gitee.com/youyacao/qingtingjava-s-sever)
[蜻蜓后台管理端qingting-java-manager-client](https://gitee.com/youyacao/qingting-java-manager-client)
#### 前端后端


[蜻蜓v系统前端](https://gitee.com/youyacao/qingting-valley-flutter)
[蜻蜓s系统前端](https://gitee.com/youyacao/qingting-s-uniapp)
[蜻蜓T系统前端](https://gitee.com/youyacao/qingting-team-flutter)
[蜻蜓q系统前端](https://gitee.com/youyacao/qingting-queen-uniapp)
[蜻蜓f系统前端](https://gitee.com/youyacao/qingting-f-uniapp)


#### 文件目录说明

[蜻蜓系统官方目录说明](https://doc.youyacao.com/web/#/8?page_id=649)



#### API接口文档

[点击查看API接口文档](https://doc.youyacao.com/web/#/16?page_id=93)

[点击查看JAVA版API接口文档](https://doc.youyacao.com/web/#/18?page_id=226)




#### 购买授权或技术支持

正版授权管网查询：

[点击查询授权以及购买其他技术支持服务](https://zhengban.youyacao.com)


官方QQ交流群：929353806







#以下说明是关于蜻蜓v系统中trtc的说明

# 跑通Demo(Flutter)
本文主要介绍如何快速运行腾讯云 TRTC Demo（Flutter）。
## 环境要求
- Flutter 版本 1.12及以上
- Android开发 
	-  Android Studio 3.5及以上版本
	-  App 要求 Android 4.1及以上设备
- iOS 开发
	- Xcode 11.0及以上版本
	- 请确保您的项目已设置有效的开发者签名

## 前提条件

您已[注册腾讯云](https://partners.cloud.tencent.com/invitation/1000009941225fd73659498d2)账号，并完成实名认证,申请与优雅草关联并且通过优雅草的审核成为客户可以享受腾讯官方的折扣，不关联则视为直客不享受任何折扣

## 操作步骤
<span id="step1"></span>
### 步骤1：创建新的应用
1. 登录实时音视频控制台，选择【开发辅助】>【[快速跑通Demo](https://console.cloud.tencent.com/trtc/quickstart)】。
2. 单击【立即开始】，输入应用名称，例如`TestTRTC`，单击【创建应用】。

<span id="step2"></span>
### 步骤2：下载 SDK 和 Demo 源码
1. 鼠标移动至对应卡片，单击【[Github](https://github.com/c1avie/trtc_demo)】跳转至 Github，下载相关 SDK 及配套的 Demo 源码。
<img src="https://imgcache.qq.com/operation/dianshi/other/flutterCard.e9d6e205d0e0a8903aa437602acafecb3958e0cb.png" height="400" />

2. 下载完成后，返回实时音视频控制台，单击【我已下载，下一步】，可以查看 SDKAppID 和密钥信息。
<span id="step3"></span>
### 步骤3：配置 Demo 工程文件
1. 解压 [步骤2](#step2) 中下载的源码包。
2. 找到并打开`/lib/debug/GenerateTestUserSig.dart`文件。
3. 设置`GenerateTestUserSig.dart`文件中的相关参数：
  <ul><li>SDKAPPID：默认为 PLACEHOLDER ，请设置为实际的 SDKAppID。</li>
  <li>SECRETKEY：默认为 PLACEHOLDER ，请设置为实际的密钥信息。</li></ul> 
<img src="https://imgcache.qq.com/operation/dianshi/other/flutterSercet.abb0c77a30a50a27bb36058bdabe1f051484c058.png" height="400" /> 
4. 返回实时音视频控制台，单击【粘贴完成，下一步】。

5. 单击【关闭指引，进入控制台管理应用】。

>本文提到的生成 UserSig 的方案是在客户端代码中配置 SECRETKEY，该方法中 SECRETKEY 很容易被反编译逆向破解，一旦您的密钥泄露，攻击者就可以盗用您的腾讯云流量，因此**该方法仅适合本地跑通 Demo 和功能调试**。
>正确的 UserSig 签发方式是将 UserSig 的计算代码集成到您的服务端，并提供面向 App 的接口，在需要 UserSig 时由您的 App 向业务服务器发起请求获取动态 UserSig。更多详情请参见[服务端生成 UserSig](https://cloud.tencent.com/document/product/647/17275#Server)。

### 步骤4：编译运行
1.执行`flutter pub get`

2.Android调试：
* （1）可以执行`flutter run`
* （2）可以使用 Android Studio（3.5及以上的版本）打开源码工程，单击【运行】即可。
  
3.iOS调试：使用 XCode（11.0及以上的版本）打开源码目录下的 /ios工程，编译并运行 Demo 工程即可。

#### 如何查看 TRTC 日志？
TRTC 的日志默认压缩加密，后缀为 .xlog。
* iOS：sandbox的Documents/log
* Android
  * 6.7及之前的版本：/sdcard/log/tencent/liteav
  * 6.8之后的版本：/sdcard/Android/data/包名/files/log/tencent/liteav/

#### 常见问题

更多常见问题参考[文档](https://cloud.tencent.com/document/product/647/51623)

##### iOS无法显示视频（Android是好的）

请确认 io.flutter.embedded_views_preview为`YES`在你的info.plist中

##### Android Manifest merge failed编译失败

请打开/example/android/app/src/main/AndroidManifest.xml文件。

1.将xmlns:tools="http://schemas.android.com/tools" 加入到manifest中

2.将tools:replace="android:label"加入到application中。

![图示](https://main.qcloudimg.com/raw/7a37917112831488423c1744f370c883.png)
