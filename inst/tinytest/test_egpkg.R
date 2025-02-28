
set.seed(1231)
x <- cbind(runif(20))

ps_matchR <- function(x) {

  match_expected <- dist(x) |> as.matrix()
  diag(match_expected) <- .Machine$integer.max
  indices <- apply(match_expected, 1, which.min)

  list(
    match_id = as.integer(unname(indices)),
    match_x  = x[indices]
  )

}

expect_equal(
  ps_matchR(x),
  ps_match3(x)
)
