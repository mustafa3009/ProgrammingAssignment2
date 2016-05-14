## Put comments here that give an overall description of what your

## Write a short comment describing this function
# Create a special list storing the getters and setters of the matrix and inverse
makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
	
	#function to set the new matrix and reset the inverse
	setMatrix <- function (newVal) {
		x <<- newVal
		inv <<- NULL 
	}
	# getter function for fetching the original matrix
	getMatrix <- function() x
	
	# setter function for setting the inverse
	setInverse <- function(i) inv <<- i
	
	#getter function for fetching the inverse 
	getInverse <- function() inv
	
	#creating a special list for caching the inverse.
	list (setMatrix=setMatrix, getMatrix=getMatrix, setInverse=setInverse, getInverse=getInverse)
}


## Write a short comment describing this function
# Cache implementation of the matrix inverse
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	
	#Check to see if the cached inverse of the matrix exists. If yes then return it.
	matInv <- x$getInverse()
	if (!is.null(matInv)) {
		message("getting the cached data")
		return(m)
	}	      
    
    #Otherwise fetch the original matrix
    matOrig = x$getMatrix()

	#Calculate the inverse.  
    matInv <- solve(matOrig, ...)
    
    #Return the inverse and also store it in the cache for subsequent fetches. 
	x$setInverse(matInv)
	matInv 			        
}

## The above code was tested with the following example
#  > mat<-matrix(c(1,4,9,0,-3,2,2,7,8),3,3)
#  > c <-makeCacheMatrix(mat)
#  > cacheSolve(c)
#         [,1]    [,2]     [,3]
# [1,] -1.18750  0.1250  0.18750
# [2,]  0.96875 -0.3125  0.03125
# [3,]  1.09375 -0.0625 -0.09375
