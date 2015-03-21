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

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
