## This code takes advantage of the lexical scoping rules in R to return the inverse of a matrix

## the makeCacheMatrix function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL                                    #initialize i and x
  set <- function(y) {                         #defines the set function
    x <<- y                                    #assigns the input value to the object in the parent environment
    i <<- NULL                                 #resets i to NULL 
  }
    get <- function() x                        #defines getter for matrix x
  setinverse <- function(inv) i <<- inv        #defines getter for the matrix x
  getinverse <- function() i                   #defines the setter for the inverse
  list(set = set,                              # gives the name 'set' to the set() function defined above
       get = get,                              # gives the name 'get' to the get() function defined above
       setinverse = setinverse,                      # gives the name 'setmean' to the setmean() function defined above
       getinverse = getinverse)                      # gives the name 'getmean' to the getmean() function defined above
    ## returns a fully formed object of type makeCacheMatrix()
}


## cacheSolve retrieves the inverse of matrix of ttpetype makeCacheMatrix
cacheSolve <- function(x, ...) {
  library(matlib)
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- inv(data, ...)
  x$setinverse(i)
  i
        ## Return a matrix that is the inverse of 'x'
}
