pragma solidity ^0.5.0;

contract TodoList {
    // uint - unsigned int
    uint public taskCount = 0; //State variable written to the smart contract

    struct Task {
        uint id;
        string content;
        bool completed;
    }

    mapping(uint => Task) public tasks; // public allows to access items in the smart contract

    constructor() public {
        createTask("Check out my fabulous todolist");
    }

    function createTask(string memory _content) public {
        taskCount ++;
        tasks[taskCount] = Task(taskCount, _content, false);
    }

}