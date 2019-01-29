

mydf <- tibble(spec = c(0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1))


odds_ratio <- 2

## Conditionally calculate the sensitivity based on the level of the odds ratio
 if(odds_ratio >=1) {
      res <- (1-mydf$spec/odds_ratio) } else {
      res <-  ((1-mydf$spec)/odds_ratio)
      }
## Combine this in the dataframe with the original specificity
mydf <- mydf %>% 
  mutate(sens = res)

# plot the reuslts
plot(mydf$spec, mydf$sens)
plot1 <- ggplot(mydf, aes(x = spec, y = sens)) +
  geom_smooth(se = FALSE) +
  scale_x_continuous("Specificity", limits = c(0,1)) +
  scale_y_continuous("Sensitivity", limits = c(0,1))
plot1
