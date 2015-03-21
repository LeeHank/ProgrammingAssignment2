## Writing a pair of functions that cache the inverse of a matrix.

## makeCacheMatrix function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(data_matrix = matrix()) {
        stored_InverseMatrix <- NULL
        set <- function(y){
                data_matrix <<- y
                stored_InverseMatrix <<- NULL
        }
        get <- function(){
                return(data_matrix)
        }
        setInverseMatrix <- function(sent_replacement_InverseMatrix){
                stored_InverseMatrix <<- sent_replacement_InverseMatrix
        }
        getInverseMatrix <- function(){
                return(stored_InverseMatrix)
        }
        list(set=set, get=get, setInverseMatrix=setInverseMatrix,
             getInverseMatrix=getInverseMatrix)
}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(madeInverseMatrix, ...) {
        local_InverseMatrix <- madeInverseMatrix$getInverseMatrix()
        if(!is.null(local_InverseMatrix)){
                message("getting cached data")
                return(local_InverseMatrix)
        }
        else{
                local_data <- madeInverseMatrix$get()
                local_InverseMatrix <- solve(local_data,...)
                madeInverseMatrix$setInverseMatrix(local_InverseMatrix)
                return(local_InverseMatrix)
        }
}
