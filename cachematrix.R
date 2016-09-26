## Write a pair of functions that cache the inverse of a matrix
#rather than compute i repeatedly

## Function makecahceMatrix

#This function creating a special "matrix" object that can cache its inverse
#9/25/2016
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(inverse) inv <<- inverse`
  getinv <- function() inv
  list(set = set, get = get, setinv = setinv, getinv = getinv)
}

makeCacheMatrix <- function(x = matrix()) {

}


#cacheSolve
#This function computes the inverse of the special "matrix" returened 
#by makeCacheMatrix above.
#If the inverse has already been calculated ( and matrix has not changed),
#then the cachesolve retrive the inverse from cache.
#We Assume that the matrix supplied invertible.


cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  if(!is.null(inv)) {
    message("getting cached result")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinv(inv)
  inv
}

#  Testing the performance of the function
#  Here consider random normal 25 points 
#  put it in a 5X5 matrix

data<-rnorm(25)
m <- matrix(data,5,5)

# Let us run the two functions
m1 <- makeCacheMatrix(m)
 cacheSolve(m1)
