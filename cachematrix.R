## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## makeCacheMatrix is a function that creates functions that will be used to 
## set and get values. Also it will set values at the cache level if the value
## has not already been asigned

makeCacheMatrix <- function(x = matrix()) {
  # It is assumed that the matrix is invertible, that automatically means
  # that the matrix is square nrows=ncols ahd thus no check is performed
  # to ensure that indeed the matrix is square
  # Also no check is done to see if the determinant is different from zero
  
  m <- NULL
  
  get <- function(){
    x # The value returned by the function get is x
  }
  
  set_inverse <- function(inverse){
    m <<- inverse # The value returned by the function setmean is mean:
    # mean is an internal function and it requires at leat one input parameter
    # that input parameter is x
  }
  
  get_inverse <- function(){
    m # The value returned by the function getmean is m
  }
  
  list( get = get,
        set_inverse = set_inverse,
        get_inverse = get_inverse)
  # a list is used to return more than one value, in this case the function
  # makeVector will return set, get, setmean and getmean

}


## Write a short comment describing this function

## cacheSolve is a function that uses the functions in makeCacheMatrix to
## check if the inverse has already been calculated. If it has been calculated 
## then it will extract the value from the cache. It it has not been calculated
## then in will call the function to calculate the inverse and put it in the cache

cacheSolve <- function(x, ...) {
  # The following is an example of how to call the function
  # Step 1: Create a matrix.
  # Step 2: Call the function makeCacheMatrix for the corresponding
  # matrix to create the functions that will be used in the following step
  # Step 3: Call the function cacheSolve for the combination of functions and
  # values of the previous step. The function will check if the inverse has
  # already been calculated, in this scenario the value will be extracted from
  # the cache. If the inverse has not been calculated then the function will make
  # the calculation and put the result in the cache.
  
  # Example
  # Step 1: prompt a <- matrix( c(1:4), 2, 2)
  # Step 2: prompt b <- makeCacheMatrix(a)
  # Step 3: prompt c <- cacheSolve(b)
  
  # The first time step 3 is executed it will output the inverse
  # If step 3 is called again with out modifying a and b the the output will
  # indicate that the value was taken from the cache
  
  m <- x$get_inverse()
  
  # The first step is to get the value of x$get_inverse
  # and check if that value has already been calculated
  
  if(!is.null(m)) {
    message("getting matrix inverse cached data")
    return(m)
  }
  
  # If the value of x$get_inverse has indeed been already calculated
  # then the function stops and returns the value of m whis is equal to 
  # x$get_inverse()
  
  # If the value of x$get_inverse has not been calculated before
  # then the following lines of code will be executed
  
  data <- x$get() # assign the value of x to the variable data 
  
  m <- solve(data, ...) # calculate the inverse of data
  
  x$set_inverse(m)
  # with this line of code the value of the inverse will be assigned to the cache
  
  m # The value returned by the function cacheSolve is m that is calculated in
  # line 41 and is equal to the inverse of the matrix x
  
        ## Return a matrix that is the inverse of 'x'
}
