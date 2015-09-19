### Introduction

Welcome in the repository of my second programming assignment.

1.  `makeCacheMatrix`: This function creates a special "matrix" object
    that can cache its inverse.
2.  `cacheSolve`: This function computes the inverse of the special
    "matrix" returned by `makeCacheMatrix` above. If the inverse has
    already been calculated (and the matrix has not changed), then
    `cacheSolve` should retrieve the inverse from the cache.

<!-- -->

### Function: `makeCacheMatrix`

The makeCacheMatrix function creates a special "matrix", which is able to cache a value
```
makeCacheMatrix <- function(x) {
        m <- NULL
        # Set the value of the Matrix
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        # Get the value of the Matrix
        get <- function() x
        # Set the value of the mean
        setInv <- function(inv) m <<- inv
        # Get the value of the mean
        getInv <- function() m
        #
        list(set = set, get = get,
             setInv = setInv,
             getInv = getInv)
}
```
The following function calculates the inverse of the special "matrix" created with the above function.

### Function: `cacheSolve`
```
cacheSolve <- function(x, ...) {
        # Checks to see if the inverse has already been calculated. 
        m <- x$getInv()
        if(!is.null(m)) { 
                message("getting cached data")
                # Gets the inversed matrix from the cache and skips the computation.
                return(m)
        }
        data <- x$get()
        # Calculates the inverse of the data
        m <- solve(data, ...)
        # Sets the value of the mean in the cache via the setmean function.
        x$setInv(m)
        m
}
```

### Run them:

Here are few lines to test the functions:

mat <- matrix(1:4, ncol = 2, nrow = 2, byrow = TRUE)
matC <- makeCacheMatrix(mat)
cacheSolve(matC)
cacheSolve(matC)

