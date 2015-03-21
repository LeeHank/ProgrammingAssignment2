## Writing a pair of functions that cache the inverse of a matrix.

## makeCacheMatrix function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(data_matrix = matrix()) {                   #I named the input of the function "data_matrix"
        stored_InverseMatrix <- NULL                                    #Initialize the 'inverse matrix' variable to NULL
        set <- function(y){                                             
                data_matrix <<- y
                stored_InverseMatrix <<- NULL
        }
        get <- function(){                                              #"get" function obtain the data from "data_matrix"
                return(data_matrix)
        }
        setInverseMatrix <- function(sent_replacement_InverseMatrix){   #"setInverseMatrix" use the inverse matrix calculated from  "cacheSolve" to replace the null inverse matrix defined above.
                stored_InverseMatrix <<- sent_replacement_InverseMatrix
        }
        getInverseMatrix <- function(){                                 #"getInverseMatrix" just obtain the value of "setInverseMatrix"
                return(stored_InverseMatrix)
        }
        list(set=set, get=get, setInverseMatrix=setInverseMatrix,       #Use list argument to list the four function describe above.
             getInverseMatrix=getInverseMatrix)
}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(madeInverseMatrix, ...) {                        #madeInverseMatrix means the value of "makeCacheMatrix()"
        local_InverseMatrix <- madeInverseMatrix$getInverseMatrix()
        if(!is.null(local_InverseMatrix)){                              #If there's a cache value in  "madeInverseMatrix$getInverseMatrix", return this value.
                message("getting cached data")
                return(local_InverseMatrix)
        }
        else{                                                           #If there's nothing in "madeInverseMatrix$getInverseMatrix", we use "solve()" function to calculate the invere matrix of the data.
                local_data <- madeInverseMatrix$get()
                local_InverseMatrix <- solve(local_data,...)
                madeInverseMatrix$setInverseMatrix(local_InverseMatrix) #And we send the calculated inverse matrix to madeInverseMatrix$setInverseMatrix as an input value
                return(local_InverseMatrix)                             #Finally we return this inverse matrix
        }
}
