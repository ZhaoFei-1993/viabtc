# ViaBTC Exchange Server

ViaBTC Exchange Server是一个具有高速性能的交易后端，专为加密货币交换而设计。它可以支持高达10000交易每秒钟和实时用户/市场数据通知通过websocket。

## 体系结构

![体系结构](https://user-images.githubusercontent.com/1209350/32476113-5ffc622a-c3b0-11e7-9755-924f17bcc167.jpeg)


**Required systems**

* MySQL: 用于保存操作日志、用户余额历史、订单历史和交易历史

* Redis: A redis sentinel group 保存市场数据

* Kafka: 一个信息系统

**Base library**

* network: 一个事件基础和高性能网络编程库，轻松支持[1000K TCP连接](http://www.kegel.com/c10k.html)。包括TCP/UDP/UNIX套接字服务器和客户端实现，一个简单的定时器，状态机，线程池 

* utils: 一些基本的库，包括日志，配置解析，一些数据结构和http/websocket/rpc服务器实现


* matchengine: 这是最重要的部分，因为它记录用户平衡并执行用户订单。存储在内存数据库中，操作日志保存在MySQL中，启动时重做操作日志。它还将用户历史写入MySQL，推送余额、订单和交易信息到kafka。

* marketprice: 从kafka读取消息，并生成k线数据

* readhistory: 从MySQL读取历史数据

* accesshttp: 支持简单的HTTP接口，隐藏上层的复杂性

* accwssws: 支持查询和推送用户和市场数据 , 需要nginx来支持wss

* alertcenter: 致命级别日志到redis列表，以便我们可以发送警报电子邮件

## Compile and Install

**Operating system**

Ubuntu 14.04 or Ubuntu 16.04. Not yet tested on other systems.

**Requirements**

See [requirements](https://github.com/viabtc/viabtc_exchange_server/wiki/requirements). Install the mentioned system or library.

您必须使用depends/hiredis来安装hiredis库。或者可能不兼容

**Compilation**

首先编译network和utils。其余的都是独立的。

**Deployment**


为matchengine、marketprice和alertcenter提供了一个实例，而readhistory、accesshttp和accwssws可以有多个实例来处理负载平衡

请不要在同一台机器上安装每个实例

每个进程在deamon中运行，并从一个进程开始。当崩溃时，它会在1s内自动重启

部署实例的最佳实践是在以下目录结构中:

```
matchengine
|---bin
|   |---matchengine.exe
|---log
|   |---matchengine.log
|---conf
|   |---config.json
|---shell
|   |---restart.sh
|   |---check_alive.sh
```

## API

[HTTP Protocol](https://github.com/viabtc/viabtc_exchange_server/wiki/HTTP-Protocol) and 
[Websocket Protocol](https://github.com/viabtc/viabtc_exchange_server/wiki/WebSocket-Protocol) 文件有中文版本. 

Python3 API 实现
[Python3 API realisation](https://github.com/grumpydevelop/viabtc_exchange_server_tools/blob/master/api/api_exchange.py)


## Websocket 授权

websocket协议有一个授权方法(' server.auth ')，用来授权websocket连接订阅用户特定的事件(trade and balance events)。

为了容纳这个方法，您的exchange前端需要提供一个内部端点，该端点从名为“authorization”的HTTP头中获取一个授权令牌，并验证该令牌并返回user_id。

内部授权端点由配置文件中的' auth_url '设置定义(' accessws/config.json ')。

示例响应: `{"code": 0, "message": null, "data": {"user_id": 1}}`


* BTC: 14x3GrEoMLituT6vF2wcEbqMAxCvt2724s
* BCC: 1364ZurPv8uTgnFr1uqowJDFF15aNFemkf
* ETH: 0xA2913166AE0689C07fCB5C423559239bB2814b6D

