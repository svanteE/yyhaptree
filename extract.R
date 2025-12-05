extract <- function(x,a,uL=TRUE){
  mf <- match.call(expand.dots = FALSE)
  no <- match(c("a"), names(mf), 0)
#  return(list(mf,body))
  if (uL)
    unlist(lapply(x,function(x) eval(mf[[no]]))) else {
      lapply(x,function(x) eval(mf[[no]]))
    }
}
