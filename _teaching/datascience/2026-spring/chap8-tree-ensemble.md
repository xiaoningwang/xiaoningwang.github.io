---
title: "第8讲：决策树与集成学习"
collection: teaching
type: "数据科学导论"
permalink: /teaching/datascience/chap8-tree-ensemble
date: 2026-04-21
---

<style>
pre.r {
  background-color: #f5f5f5;
  border-left: 3px solid #3498db;
  padding: 10px;
  margin: 10px 0;
  font-family: 'Courier New', Courier, monospace;
  font-size: 14px;
  line-height: 1.5;
  overflow-x: auto;
}
</style>

# 分类问题的提出

## 导入：为什么要学习分类方法

在前面的课程中，我们已经学习了数据处理、数据可视化和回归分析。回归分析主要解决的是**因变量为连续数值**的问题，例如收入预测消费、年龄预测最大心率等。但在现实问题中，很多任务的输出并不是连续值，而是离散的类别。例如：

- 用户是否会违约；
- 邮件是否是垃圾邮件；
- 新闻属于体育、财经还是娱乐；
- 某个病人是否患病；
- 某条评论是正面、负面还是中性。

这一类问题都属于**分类问题**。当因变量取离散值时，我们称之为分类。模仿回归的表达形式，分类问题也可以写成：

$$
y=f(x)
$$

其中，$f$ 是关于 $x$ 的函数，通常称为**分类器**（classifier）。常见的分类器包括 Logistic 模型、决策树、随机森林、支持向量机等。

## 分类问题的基本结构

分类的基本任务是：利用一组带标签的训练样本 $(x_1,y_1),(x_2,y_2),\cdots,(x_N,y_N)$，学习一个由输入到输出的映射关系，并用该关系对新的观测值进行类别判断。

从结构上看，分类问题通常包括三个部分：

1. **训练样本**：包含自变量和已知类别标签；
2. **学习系统**：根据训练样本建立分类模型；
3. **分类系统**：将新的观测值输入模型，输出预测类别或类别概率。

与回归不同，分类不仅关心数值预测，更关心“分到哪一类”“分类边界在哪里”“分类错误率有多高”。

# Probit 与 Logistic 模型

## 线性概率模型（LPM）

对于二元分类问题，我们可以先从一个最简单的模型出发。设因变量 $Y_i$ 只取两个值：

- $Y_i=1$ 表示某事件发生；
- $Y_i=0$ 表示某事件不发生。

考虑如下模型：

$$
Y_i=X_i\beta+\varepsilon_i,\quad i=1,2,\cdots,N
$$

若假定 $E(\varepsilon_i\|X_i)=0$，则有：

$$
E(Y_i|X_i)=X_i\beta
$$

另一方面，由于 $Y_i$ 是 0-1 变量，在给定 $X_i$ 的条件下，若事件发生的概率为 $p$，则：

$$
Prob(Y_i=1|X_i)=p,\quad Prob(Y_i=0|X_i)=1-p
$$

因此，条件期望可写成：

$$
E(Y_i|X_i)=1\cdot Prob(Y_i=1|X_i)+0\cdot Prob(Y_i=0|X_i)=p
$$

于是得到：

$$
E(Y_i|X_i)=X_i\beta=Prob(Y_i=1|X_i)=p
$$

这说明，给定自变量 $X_i$ 时，事件发生的概率被写成了 $X_i\beta$ 的线性形式。于是有：

$$
Y_i=X_i\beta+\varepsilon_i
$$

这个模型称为**线性概率模型**（Linear Probability Model, LPM）。它实际上是用普通线性回归直接处理二元因变量。

## 线性概率模型的局限性

LPM 虽然形式简单，但存在明显问题：

1. $\hat Y_i=X_i\hat\beta$ 不能保证落在 $[0,1]$ 区间内，可能出现“大于 1”或“小于 0”的概率预测；
2. 因变量是二元变量，误差项不服从通常线性回归所依赖的正态分布；
3. LPM 中扰动项的方差是异方差的，会随 $X_i$ 的变化而变化。

因此，对于二元定性因变量，一般不推荐直接使用 LPM，而是需要使用更适合概率建模的方法。

## Probit 与 Logistic 模型的思想

为了保证估计得到的概率始终处于 $[0,1]$ 区间，一个自然的想法是：对线性组合 $X_i\beta$ 再套上一层分布函数 $F(\cdot)$，令

$$
p(X_i)=Prob(Y_i=1|X_i)=F(X_i\beta)
$$

这样，只要 $F(\cdot)$ 是一个取值范围在 $[0,1]$ 的分布函数，就能保证预测概率合理。

常见的两种选择是：

### 1. Probit 模型

如果 $F(\cdot)$ 取标准正态分布函数 $\Phi(\cdot)$，则有：

$$
p(X_i)=Prob(Y_i=1|X_i)=\Phi(X_i\beta)=\int_{-\infty}^{X_i\beta}\frac{1}{\sqrt{2\pi}}\exp\left(-\frac{z^2}{2}\right)dz
$$

这时得到的概率模型称为 **Probit 模型**。

### 2. Logistic / Logit 模型

如果 $F(\cdot)$ 取 Logistic 分布函数 $\Lambda(\cdot)$，则有：

$$
p(X_i)=Prob(Y_i=1|X_i)=\Lambda(X_i\beta)=\frac{\exp(X_i\beta)}{1+\exp(X_i\beta)}
$$

这时得到的模型称为 **Logit 模型** 或 **Logistic 回归模型**。

特别地，Logit 模型还可以写成链接函数的形式：

$$
\log\left(\frac{p(X_i)}{1-p(X_i)}\right)=X_i\beta=\beta_0+\beta_1X_{1i}+\cdots+\beta_pX_{pi}
$$

其中：

- $\log\left(\frac{p(X_i)}{1-p(X_i)}\right)$ 称为**链接函数**（link function）；
- $\frac{p(X_i)}{1-p(X_i)}$ 称为**赔率**或**优势比**（odds ratio），表示事件发生概率与不发生概率的比值。

## 基于潜变量模型的理解

二元选择模型还可以从潜变量模型的角度理解。设存在一个无法直接观测的潜变量：

$$
Y_i^*=X_i\beta+\varepsilon_i,\quad i=1,2,\cdots,T
$$

实际观测到的因变量为：

$$
Y_i=
\begin{cases}
1, & \text{if } Y_i^*>0 \\
0, & \text{if } Y_i^*\le 0
\end{cases}
$$

其中，$Y_i^*$ 是潜变量或隐变量（latent variable），我们不能直接看到它的数值，只能看到它是否超过某个阈值。因此，二元分类问题也可以理解为：潜在倾向超过阈值时事件发生，否则事件不发生。

### Probit 模型的潜变量解释

如果假设：

1. $E(\varepsilon_i\|X_i)=0$；
2. $\varepsilon_i$ 独立同分布，并服从正态分布；
3. $rank(X_i)=k$；

则：

$$
Prob(Y_i=1|X_i)=\Phi(X_i\beta)
$$

### Logit 模型的潜变量解释

如果假设：

1. $E(\varepsilon_i\|X_i)=0$；
2. $\varepsilon_i$ 独立同分布，并服从 Logistic 分布；
3. $rank(X_i)=k$；

则：

$$
Prob(Y_i=1|X_i)=\Lambda(X_i\beta)
$$

## 参数估计：最大似然估计（MLE）

Probit 和 Logit 模型通常采用**最大似然估计法**（Maximum Likelihood Estimation, MLE）进行参数估计。

对于 Probit 或 Logit 模型，有：

$$
Prob(Y_i=1|X_i)=F(X_i\beta)
$$

$$
Prob(Y_i=0|X_i)=1-F(X_i\beta)
$$

于是似然函数可写为：

$$
L=\prod_{i=1}^N F(X_i\beta)^{Y_i}(1-F(X_i\beta))^{1-Y_i}
$$

相应的对数似然函数为：

$$
\log(L)=\sum_{i=1}^N \left[Y_i\log F(X_i\beta)+(1-Y_i)\log(1-F(X_i\beta))\right]
$$

由于令导数为零后一般不存在显式解析解，因此需要借助迭代算法进行求解，如：

- Newton-Raphson 法；
- 二次爬坡法（Quadratic Hill Climbing）。

## 边际效应分析

在线性回归中，系数本身就可以直接反映自变量变化一个单位对因变量均值的影响；但在 Probit 和 Logit 模型中，自变量对事件发生概率的影响不是常数，因此需要借助**边际效应**分析。

### Probit 模型的边际效应

$$
\frac{\partial Prob(Y_i=1|X_i)}{\partial X_i}=\phi(X_i\beta)\beta
$$

### Logit 模型的边际效应

$$
\frac{\partial Prob(Y_i=1|X_i)}{\partial X_i}=\Lambda(X_i\beta)(1-\Lambda(X_i\beta))\beta
$$

可以看到，这两个模型的边际效应都随着 $X_i$ 的取值变化而变化。因此，实际分析中通常报告：

- 平均边际效应；
- 在样本均值处的边际效应。

## 似然比检验

在概率模型中，似然比检验类似于回归分析中的整体显著性检验。原假设通常是“全部自变量系数均为 0”。检验统计量为：

$$
LR=2(\ln L-\ln L_0)
$$

其中：

- $\ln L$ 为完整模型的对数似然值；
- $\ln L_0$ 为只含截距项的空模型的对数似然值。

在原假设成立时，$LR$ 近似服从自由度为 $k-1$ 的 $\chi^2$ 分布。

## 概率预测

如果已经得到了参数估计值 $\hat\beta$，则可以对新样本 $X_0$ 进行概率预测。

### Probit 预测

$$
\hat P(X_0)=\widehat{Prob}(Y_i=1|X_0)=\Phi(X_0\hat\beta)
$$

### Logit 预测

$$
\hat P(X_0)=\widehat{Prob}(Y_i=1|X_0)=\Lambda(X_0\hat\beta)=\frac{\exp(X_0\hat\beta)}{1+\exp(X_0\hat\beta)}
$$

同时，也可以直接计算对应的链接函数值：

$$
\widehat{Link}=\log\left(\frac{\hat p(X_0)}{1-\hat p(X_0)}\right)=X_0\hat\beta
$$

# 判别分析

## 判别分析的基本思想

对于二元因变量，Logistic 模型是直接对条件分布 $Pr(Y=k\|X=x)$ 建模；而**判别分析**采取的是另一种思路：先对给定类别下的自变量分布建模，再利用贝叶斯公式反推后验概率 $Pr(Y=k\|X=x)$。

简言之：

- Logistic 回归：直接建模“给定 $X$，$Y$ 的分布”；
- 判别分析：先建模“给定 $Y$，$X$ 的分布”，再反推分类结果。

## 何时使用判别分析

判别分析通常适用于以下情形：

1. 当类别之间区分度较高时；
2. 当样本量较小且自变量近似服从正态分布时；
3. 当因变量有多类别取值时，判别分析往往比二元 Logistic 推广更常用。

本讲主要介绍三类常见方法：

- 朴素贝叶斯判别分析；
- 线性判别分析（LDA）；
- 二次判别分析（QDA）。

## 贝叶斯分类器与朴素贝叶斯思想

对于分类模型，我们的目标是构造一个从输入空间到输出空间的映射：

$$
f(X)\to Y
$$

为了最小化分类错误率，一个最简单也最合理的策略是：给定 $X=x_0$ 时，把它分到后验概率最大的那一类，即：

$$
\max_j Pr(Y=j|X=x_0)
$$

这种方法称为**贝叶斯分类器**。它在理论上能够达到最低测试错误率，这一最低错误率称为**贝叶斯错误率**。

在 $X=x_0$ 这一点上的错误率为：

$$
1-\max_j Pr(Y=j|X=x_0)
$$

整个分类器的贝叶斯错误率为：

$$
1-E\left(\max_j Pr(Y=j|X)\right)
$$

朴素贝叶斯分类器是在贝叶斯分类器基础上做出“各特征条件独立”假设后得到的简化模型，优点是计算简单、训练速度快，在高维文本分类中尤其常见。

## 线性判别分析（LDA）

线性判别分析（Linear Discriminant Analysis, LDA）的核心思想是：

1. 假设每一类的自变量都服从正态分布；
2. 假设各类共享相同的协方差矩阵；
3. 结合贝叶斯公式构造后验概率；
4. 将观测值分到判别函数值最大的那一类。

当自变量维度 $p=1$ 时，可以假设每一类服从一维正态分布，且各类方差相同；当 $p>1$ 时，假设第 $k$ 类观测服从多元正态分布：

$$
X\sim N(\mu_k,\Sigma)
$$

其中，$\mu_k$ 为第 $k$ 类的均值向量，$\Sigma$ 为所有类别共同的协方差矩阵。其密度函数为：

$$
f_k(x)=\frac{1}{(2\pi)^{p/2}|\Sigma|^{1/2}}\exp\left(-\frac{1}{2}(x-\mu_k)^T\Sigma^{-1}(x-\mu_k)\right)
$$

由于判别函数关于 $x$ 是线性的，因此称为线性判别分析。

## 二次判别分析（QDA）

LDA 的关键假设是“各类协方差矩阵相同”，但现实中这一假设往往不容易满足。于是，二次判别分析（Quadratic Discriminant Analysis, QDA）放宽了这一条件。

QDA 假设：

$$
X\sim N(\mu_k,\Sigma_k)
$$

即第 $k$ 类观测拥有各自不同的协方差矩阵 $\Sigma_k$。因此，QDA 的判别边界通常是二次曲线或二次曲面，而不再是直线或超平面。这也是“二次判别分析”名称的由来。

## LDA 与 QDA 的比较

可以从三个角度理解两者差异：

1. **假设条件**：LDA 假设协方差矩阵相同；QDA 允许各类协方差不同；
2. **边界形状**：LDA 产生线性边界；QDA 产生二次边界；
3. **偏差-方差权衡**：LDA 假设更强，参数更少，样本较小时更稳定；QDA 更灵活，但对样本量要求更高。

# 分类问题的评判准则

## 混淆矩阵

分类问题中，最基础的评价工具是**混淆矩阵**。对二分类问题，它通常包含四种结果：

- 真负类（TN）：真实为负，预测也为负；
- 假正类（FP）：真实为负，预测为正；
- 假负类（FN）：真实为正，预测为负；
- 真正类（TP）：真实为正，预测也为正。

基于混淆矩阵，可以计算模型整体的正确率：

$$
accuracy=\frac{TN+TP}{N+P}
$$

相应地，整体错误率为：

$$
1-accuracy
$$

## 常见评价指标

除了 accuracy 之外，分类问题中还有一些更重要、更细致的评价指标：

### 1. 灵敏度 / 召回率（Sensitivity / Recall）

$$
\frac{TP}{TP+FN}
$$

表示真实正类中，被正确识别出来的比例。

### 2. 特异度（Specificity）

$$
\frac{TN}{TN+FP}
$$

表示真实负类中，被正确识别出来的比例。

### 3. 误判率（False Positive Rate）

$$
\frac{FP}{TN+FP}=1-\text{specificity}
$$

### 4. 漏判率（False Negative Rate）

$$
\frac{FN}{TP+FN}=1-\text{recall}
$$

### 5. 精确率（Precision）

$$
\frac{TP}{TP+FP}
$$

表示预测为正的样本中，真正为正的比例。

这些指标各有侧重：

- 在医学筛查中，更关注召回率，避免漏诊；
- 在垃圾邮件识别中，可能更关注精确率，避免误判正常邮件；
- 在类别不平衡问题中，单纯使用 accuracy 往往是不够的。

## ROC 曲线与 AUC

ROC 曲线（Receiver Operating Characteristic Curve）是评价二分类模型性能的重要工具。它通过改变分类阈值，考察模型在不同阈值下的：

- 横轴：假正率（1 - specificity）；
- 纵轴：真正率（sensitivity）。

如果 ROC 曲线越靠近左上角，说明模型区分正负类的能力越强。

ROC 曲线下方的面积称为 **AUC（Area Under Curve）**。AUC 越大，表示模型整体预测准确性越高。通常可以粗略理解为：

- AUC = 0.5：几乎等同随机猜测；
- AUC 越接近 1：分类性能越好。

# R 实现

## Logistic / Probit 模型

在 R 中，可以使用 `glm()` 函数拟合广义线性模型，其中包括 Logit 和 Probit 模型。其基本形式为：

```r
glm(formula, family = family(link = function), data = )
```

其中：

- `formula` 为模型公式；
- `family` 用于设置分布族和链接函数；
- 当采用二项分布和 `logit` 链接时，即为 Logistic 回归；
- 当采用二项分布和 `probit` 链接时，即为 Probit 模型。

例如：

```r
fit_logit <- glm(y ~ x1 + x2, family = binomial(link = "logit"), data = dat)
fit_probit <- glm(y ~ x1 + x2, family = binomial(link = "probit"), data = dat)
summary(fit_logit)
summary(fit_probit)
```

## 判别分析与朴素贝叶斯

在 R 中：

- `MASS` 包中的 `lda()` 可用于线性判别分析；
- `MASS` 包中的 `qda()` 可用于二次判别分析；
- `e1071` 包中的 `naiveBayes()` 可用于朴素贝叶斯分类；
- `ROCR` 包可用于绘制 ROC 曲线。

例如：

```r
library(MASS)
fit_lda <- lda(group ~ x1 + x2 + x3, data = dat)
fit_qda <- qda(group ~ x1 + x2 + x3, data = dat)
```

```r
library(e1071)
fit_nb <- naiveBayes(group ~ x1 + x2 + x3, data = dat)
```

```r
library(ROCR)
pred <- prediction(prob, truth)
perf <- performance(pred, "tpr", "fpr")
plot(perf)
```

# 本讲小结

本讲围绕分类方法展开，重点介绍了二元分类与多类别分类中的若干基础方法。总体来看，可以把本讲内容概括为以下几个层次：

1. 分类问题研究的是离散因变量的预测；
2. LPM 是最简单的二元分类模型，但存在概率越界、异方差等问题；
3. Probit 和 Logistic 模型通过分布函数把线性组合映射到 $[0,1]$，是更科学的概率模型；
4. 判别分析从“先建模 $X\|Y$，再反推 $Y\|X$”的角度解决分类问题；
5. LDA 和 QDA 是多类别分类中非常经典的判别方法；
6. 混淆矩阵、精确率、召回率、ROC 与 AUC 是分类模型评估的基础工具。

如果用一句话概括本讲内容，可以写成：

**分类方法的核心任务，是根据已知样本学习类别划分规则，并通过概率模型或判别函数，将新的观测值尽可能准确地分到正确类别中。**

