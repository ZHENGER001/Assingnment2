makeMatrix_1<- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse
    )
}

cacheMatrix_1<-  function(x, ...) {
    m <- x$getinverse()
    if(!is.null(m)) {
        print("getting cached matrix")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
}

>My_matrix<- makeMatrix_1(matrix(rnorm(16),ncol = 4,nrow = 4))
>My_matrix$get()
 [,1]       [,2]        [,3]       [,4]
[1,] -0.68166048  0.5314962 -0.30097613 -1.9143594
[2,] -0.32427027 -1.5183941 -0.52827990  1.1765833
[3,]  0.06016044  0.3065579 -0.65209478 -1.6649724
[4,] -0.58889449 -1.5364498 -0.05689678 -0.4635304
>My_matrix$getinverse()
NULL
>cacheMatrix_1(My_matrix)
 [,1]       [,2]       [,3]       [,4]
[1,]  2.766127 -1.7935906  1.3219813 -1.0968430
[2,] -2.818105  1.2989401 -1.0491404  1.1623214
[3,]  2.005052 -1.4010717  0.5772654 -1.1107781
[4,]  1.099558 -0.7762906  0.3093167 -0.0821955
>cacheMatrix_1(My_matrix)
"getting cached matrix"
          [,1]       [,2]       [,3]       [,4]
[1,]  2.766127 -1.7935906  1.3219813 -1.0968430
[2,] -2.818105  1.2989401 -1.0491404  1.1623214
[3,]  2.005052 -1.4010717  0.5772654 -1.1107781
[4,]  1.099558 -0.7762906  0.3093167 -0.0821955
My_matrix$set(matrix(c(2,6,9,4,6,7,4,6,5),3,3)
+ )
> My_matrix$getinverse()
NULL
> cacheMatrix_1(My_matrix)
     [,1]       [,2]          [,3]
[1,] -0.5  0.3333333  4.934325e-17
[2,]  1.0 -1.0833333  5.000000e-01
[3,] -0.5  0.9166667 -5.000000e-01
> cacheMatrix_1(My_matrix)
"getting cached matrix"
     [,1]       [,2]          [,3]
[1,] -0.5  0.3333333  4.934325e-17
[2,]  1.0 -1.0833333  5.000000e-01
[3,] -0.5  0.9166667 -5.000000e-01
> My_matrix$getinverse()
     [,1]       [,2]          [,3]
[1,] -0.5  0.3333333  4.934325e-17
[2,]  1.0 -1.0833333  5.000000e-01
[3,] -0.5  0.9166667 -5.000000e-01
