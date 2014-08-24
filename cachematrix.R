## Plug in any matrix using the makecacheMatrix or set function.. Use cacheSolve to cache and get inverse 
## for the first time and in future retrieve inverse from the cache object...

## Creates a matrix object with get,set,setinverse and get inverse functions

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
  set <- function(y) {
    print(y)
    x <<- y
    print(x)
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Used to calculate inverse of a matrix if not found in the previous matrix object, else returns inverse from cache

cacheSolve <- function(x) {
        ## Return a matrix that is the inverse of 'x'
         m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinverse(m)
  m
}
