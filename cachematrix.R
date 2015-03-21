## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

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
             getInverMatrix=getInverMatrix)
}

## Write a short comment describing this function

cacheSolve <- function(madeInverseMatrix, ...) {
        ## Return a matrix that is the inverse of 'x'
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
