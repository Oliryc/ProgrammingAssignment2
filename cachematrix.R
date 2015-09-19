######################################
#            Cache MATRIX
######################################
# The makeCacheMatrix function creates a special "matrix", which is able to cache a value
makeCacheMatrix <- function(x = matrix()) {
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

# The following function calculates the inverse of the special "matrix" created with the above function.
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
        # Return a matrix that is the inverse of 'x'
        m
}

