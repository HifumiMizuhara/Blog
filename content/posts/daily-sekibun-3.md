---
title: "【積分デイリー】#2 f'(x)/f(x)形の積分法"
date: 2026-08-08T22:14:00+09:00
draft: false
categories: ['数学']
tags: ['数学','積分']
---

### 問題
積分せよ：
$$\int \frac{\sin x}{\sin x+\cos x}\,dx$$

### 関数の微分とそれ自身の比の積分

$$\int \frac{f'(x)}{f(x)}\,dx = \log \lvert f(x)\rvert + C$$
なので



分子の $\sin x$ を **分母そのもの**の $\sin x + \cos x$ と **分母の微分**の $\cos x - \sin x$で表せるか考えます。

ここで **未定係数法** を使います。
$$\sin x = A(\sin x+\cos x) + B(\cos x-\sin x)$$

$$\text{これを解くと}\qquad (A,B) = \left(\frac{1}{2}, -\frac{1}{2}\right)$$

i.e. 求める積分は

$$\int \frac{\frac{1}{2}(\sin x+\cos x) - \frac{1}{2}(\cos x-\sin x)}{\sin x+\cos x}\,dx$$

$$= \int \left(\frac{1}{2} - \frac{\frac{1}{2}(\sin x+\cos x)'}{\sin x+\cos x}\right)\,dx$$

$$= \frac{1}{2}x - \frac{1}{2}\log\lvert\sin x+\cos x\rvert + C$$

