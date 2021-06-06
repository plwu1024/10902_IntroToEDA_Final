# EDA導論Final

## 題目: Problem A

## Links
[Github](https://github.com/plwu1024/10902_IntroToEDA_Final)
[HackMD](https://hackmd.io/@plwu1024/10901_IntroToEDA_Final/edit)



## 6/6 討論

### 討論內容
 - 這三篇ref都很難，用了很多不同技術，對只學了EDA一學期的我們太難掌握了
 - 沒有太多想法，可能先從簡單的想法開始：
     - 先比對R1跟R2，然後找出不同處
     - 將不同處寫成Patch套到G1
     - 套到G1前可能可以再optimize
 - R1跟R2可能差很多，很難比對
 - R1跟R2的差別處可能無法直接對應到G1的部分
     - 擴展Patch的範圍直到找到可對應到的部分
 - 目前程式可以順利讀檔、正在做apply_patch
     - 需要做到一個gate可以找到他的fanins和fanouts
     - 需要處理assign指令 -> 用buf
     - 需要處理陣列input
 - 心態炸裂，好難！！

### 分工
尚未決定
1. 比對R1, R2 找出這兩者間的Patch
2. 從Patch, R1, G1找出G1 上的Patch
3. 簡化Patch