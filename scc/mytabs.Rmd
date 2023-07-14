---
title: "Tabset Demonstration"
output: html_document
---

```{r}
#| include = FALSE
library(dplyr)
library(ggplot2)
```

There is a negative correlation between horsepower and miles per gallon.

## Tab {.tabset}

### Plot

```{r}
mtcars %>% 
  ggplot(aes(x = hp, y = mpg)) +
  geom_point()
```

### Table

```{r}
#| collapse = TRUE
mtcars %>% 
  glimpse()
```
