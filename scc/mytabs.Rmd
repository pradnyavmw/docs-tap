## Results {.tabset}

### Tab One
CowSample <- data.frame (CowID = c(sample(400:599, 100, replace=FALSE)),
                         Week1 = c(runif(100, min=10, max=20)),
                         Week2 = c(runif(100, min=15, max=25)),
                         Week3 = c(runif(100, min=18, max=28)),
                         dairy = c(sample(1:5, 100, replace=TRUE)))
head(CowSample) 

### Tab Two

## {-}

With the above unnumbered (`{-}`) and empty section header,
we can end the tabset and continue to write more paragraphs.
