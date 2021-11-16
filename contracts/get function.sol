pragma solidity 0.8.7;

contract changeandgetnumber
{
uint256 number;             /*  declare a state variable. */
                            /*  state indicates that it is a variable that is stored permanently on the blockchain */
                            /*  If we allow it the state variable can be changed. */
    
    function                /* keyword to declare/ create a function */
    changenumber(uint _num) /* _num underscore indicates that this is an argument/input that goes into a fucntion*/  
    public                  /* Visibility modifier define the visibility of state variables or functions. */
    {                       /* curly brackets indicate that the start of the function logic/ program lines which will be executed
    number = _num;          /* this function will take any number we put in and change the state variable*/
    }
    
    function                /* keyword to declare/ create a function */
    getnumber()             /* no input argument bc we only going to read a number / state variable */
    public                  /* this function Can be accessed by all contracts. */
    view 
    returns                 /* keword which gives us back a value when we read */
    (uint256)               /* this declares the datatype we read. uint means its a postive number, 256 means it can store up to 256 bits) */
    {
    return number;           /* this function reads and returns number of the state variable */
    }
        
}


 /* constructor does initialze the state variables to certain values when the smart contracts gets depolyed to the blockchain. */