---
title: "C++とWinSock2でHTTPサーバを自作してみよう！#0 ソケットとWinSockRuntime"
date: 2026-08-08T22:14:00+09:00
draft: false
categories: ['プログラミング']
tags: ['ネットワーク','HTTP', 'C++']
---

### まえがき
Pythonなどでならコマンド1行だけ打てば立ち上げられるHTTPサーバですが、それは実は非常に奥深いシステムであり、ネットワークを学ぶうえでの極めて重要な基礎となります。

このシリーズでは、次のような最小構成のHTTPサーバを目指して行く流れとなります。

{{< asset-image src="img/http-server-eg.png" alt="最小構成のHTTPサーバの構成図" >}}

### ソケット

ソケットは、ネットワーク通信のための「通信口」と考えられます。電話の喩えで考えるなら、IPアドレスとポートは「電話番号」、そしてソケットは「受話器」の役割にあたります。

{{< asset-image src="img/http-server-socket-phone.png" alt="ソケットを受話器にたとえた図" >}}

*By GPT Image 2*


Windowsでソケットを扱いたい場合、`WinSock2.h`というライブラリが必要となってきます。

ソケットを使う前には `WSAStartUp` という関数で初期化する必要があり、使い終わったら丁寧に `WSACleanup()` を呼び出して掃除していく必要があります。そこを抜かすとよくないため、C++では **RAII** という考え方で初期化とクリーンアップを扱います。

### RAIIで実装するWinsockRuntime

RAIIは「Resource Acquisition Is Initialization」（リソース獲得は初期化である）の略記で、リソースの初期化とクリーンアップをオブジェクトの寿命に紐づけることで、非常に賢くかつ簡単にそれを管理できてしまうという手法です。

{{< asset-image src="img/http-server-raii.png" alt="RAIIによるWinSockの初期化と終了処理の図" >}}

C++のオブジェクトは初期化時必ずその **コンストラクタ** を呼び出し、破棄時必ずその **デストラクタ** を呼び出すようにできています。よって `WSAStartUp` をオブジェクトのコンストラクタ内で呼び出し、`WSACleanup()`を同オブジェクトのデストラクタ内で呼び出せば、オブジェクトの寿命が終わるのと同時に必ずきれいにクリーンアップされます。

```cpp
// winsock_runtime.h

#pragma once

class WinsockRuntime {
public:
    WinsockRuntime();
    ~WinsockRuntime();

    WinsockRuntime(const WinsockRuntime&) = delete;
    WinsockRuntime& operator=(const WinsockRuntime&) = delete;
};

```

```cpp
// winsock_runtime.cpp

#include "winsock_runtime.h"

#include <WinSock2.h>

#include <stdexcept>
#include <string>

WinsockRuntime::WinsockRuntime() {
    WSADATA wsa_data{};
    const int result = WSAStartup(MAKEWORD(2, 2), &wsa_data);
    if (result != 0) {
        throw std::runtime_error("WSAStartup failed: " + std::to_string(result));
    }
}

WinsockRuntime::~WinsockRuntime() {
    WSACleanup();
}

```

### 次回予告

本記事では、ソケットとは受話器みたいなものと述べていました。実際のネット通信ではまさにサーバー側とクライアント側の両方がそれぞれ別のソケット（受話器）を持ち通信していくイメージとなります。

次回では詳しくソケットの通信とクライアントソケットを取得する`TcpListener`クラスの構築を扱います。

いかにCの生`SOCKET`をRAIIでラップして、そしていかにクライアント側のソケットを取得するのか。どうぞ次回もお楽しみに。
