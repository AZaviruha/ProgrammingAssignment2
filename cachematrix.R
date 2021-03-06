## This module contains functions for calculation 
## of inverse of a matrix, that supports caching.

## Returns matrix object, with cached inverse
makeCacheMatrix <- function (x = matrix()) {
    inv <- NULL
    set <- function (y) {
        x   <<- y
        inv <<- NULL
    }
    
    get <- function () x
    
    setInverse <- function (inverse) inv <<- inverse
    
    getInverse <- function () inv
    
    list(set = set, 
         get = get,
         setInverse = setInverse,
         getInverse = getInverse)    
}


## Return a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) {
    inv <- x$getInverse()
    if (!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    
    data <- x$get()
    inv <- solve(data, ...)
    x$setInverse(inv)
    inv
}
