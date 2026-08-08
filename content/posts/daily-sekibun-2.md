---
title: "【積分デイリー】#1 exp(x)g(x)形の積分法"
date: 2026-08-08T00:14:00+09:00
draft: false
categories: ['数学']
tags: ['数学','積分', '指数関数']
---

### 問題

積分せよ：

$$\int \frac{e^{x}(1+\sin x)}{1+\cos x}\,dx$$

### 積の微分公式に注目せよ

$$\{f(x)g(x)\}^{\prime} = f^{\prime}(x)g(x) + f(x)g^{\prime}(x)$$

ここで $f(x):=e^x$ とすると

$$\left\{e^x g(x)\right\}^{\prime} = e^x\left\{g(x)+g^{\prime}(x)\right\}$$

$$\text{i.e.}\quad \int e^x\left\{g(x)+g^{\prime}(x)\right\}\,dx = e^x g(x)+C \qquad \text{（ただし、\(C\) は積分定数）}$$

これをさらに一般化すると

$$\left\{e^{ax}g(x)\right\}^{\prime} = e^{ax}\left\{ag(x)+g^{\prime}(x)\right\}$$

$$\text{i.e.}\quad \int e^{ax}\left\{ag(x)+g^{\prime}(x)\right\}\,dx = e^{ax}g(x)+C \qquad \text{（ただし、\(C\) は積分定数）}$$

つまり

$\frac{(1+\sin x)}{1+\cos x}$ を $g(x)+g^{\prime}(x)$ の形にできれば、積分できるということ。

### Weierstrass 置換

$$\text{Weierstrass置換}\qquad \tan\frac{x}{2}=t \text{ とおくと}$$

$$\sin x=\frac{2t}{1+t^2}$$

$$\cos x=\frac{1-t^2}{1+t^2}$$

よって

$$\frac{1+\sin x}{1+\cos x} = \frac{1+\frac{2t}{1+t^2}}{1+\frac{1-t^2}{1+t^2}} = \frac{t^2+2t+1}{2} = \frac{t^2}{2}+t+\frac{1}{2}$$

ここで考えるのは $\tan$ の微分法。

$$(\tan x)^{\prime}=\sec^2 x$$

$$\therefore\quad \left(\tan\frac{x}{2}\right)^{\prime} = \frac{1}{2}\sec^2\frac{x}{2}$$

$$\sec^2 x-\tan^2 x=1 \quad\text{より}\quad \sec^2 x=1+\tan^2 x$$

$$\therefore\quad \frac{1}{2}\sec^2\frac{x}{2} = \frac{1}{2}+\frac{1}{2}\tan^2\frac{x}{2} = \frac{1}{2}+\frac{1}{2}t^2$$

よって積分は

$$\int e^x \left\{\tan\frac{x}{2}+\left(\tan\frac{x}{2}\right)^{\prime}\right\}\,dx$$
と書き換えられる。

前述の結論を適用すると積分結果は

$$e^x\tan\frac{x}{2}+C \qquad \text{（\(C\) は積分定数）}$$

