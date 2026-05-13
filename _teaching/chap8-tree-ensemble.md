---
title: "第8讲：决策树与集成学习"
collection: teaching
type: "数据科学导论"
permalink: /teaching/chap8-tree-ensemble
date: 2026-05-13
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

# 第8讲：决策树与集成学习

## 导入：为什么要学习决策树与集成学习

在前面的课程中，我们已经学习了回归方法和分类方法。决策树是一种非常直观的机器学习模型，它通过递归地划分特征空间来进行预测。而集成学习则是将多个弱学习器组合起来，形成一个强学习器的方法。

## 决策树的基本概念

### 决策树的结构

决策树由节点和边组成：
- **根节点**：表示整个数据集
- **内部节点**：表示特征测试
- **叶节点**：表示预测结果
- **边**：表示测试结果

### 决策树的学习过程

决策树的学习过程包括以下步骤：
1. 选择最优特征进行划分
2. 递归地划分数据集
3. 剪枝以防止过拟合

## 决策树的划分准则

### 信息增益

信息增益是决策树学习中常用的划分准则，它基于信息论中的熵概念。

### 信息增益比

信息增益比对可取值数目较多的特征进行了惩罚。

### Gini 指数

Gini 指数衡量数据集的纯度。

## 集成学习概述

集成学习通过组合多个模型来提高预测性能，主要包括：
- **Bagging**：并行训练多个模型，通过投票或平均进行预测
- **Boosting**：串行训练模型，每个模型关注前一个模型的错误
- **Stacking**：将多个模型的输出作为输入，训练一个元模型

## 随机森林

随机森林是一种基于 Bagging 的集成方法，它通过随机选择特征来增加模型的多样性。

## Gradient Boosting

Gradient Boosting 是一种基于 Boosting 的集成方法，它通过梯度下降来优化损失函数。

## R 实现

```r
# 决策树
library(rpart)
fit_tree <- rpart(Species ~ ., data = iris)

# 随机森林
library(randomForest)
fit_rf <- randomForest(Species ~ ., data = iris)

# Gradient Boosting
library(xgboost)
fit_xgb <- xgboost(data = x, label = y, nrounds = 100)
```

## 本讲小结

本讲介绍了决策树与集成学习的基本概念和方法，包括决策树的构建、集成学习的三种主要策略，以及在 R 中的实现。
