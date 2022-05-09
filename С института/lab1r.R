require(ggplot2)
require(tidyr)
table = diamonds
cut = unique(table[["cut"]])
color = unique(table[["color"]])
clarity = unique(table[["clarity"]])
res1 = expand.grid(cut, color)
res1 = unite(res1,"United", c("Var1","Var2"),sep="_")
res1= as.factor(res1[["United"]])
res2 = expand.grid(res1, clarity)
res = separate(res2,"Var1",c("cut","color"),sep="_")
names(res)[names(res) == "Var2"] <- "clarity"
res
