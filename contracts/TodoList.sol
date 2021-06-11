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
    
    event TaskCreated(
        uint id,
        string content,
        bool completed
    );

    event TaskCompleted(
        uint id,
        bool completed
    );

    constructor() public {
        createTask("Check out my fabulous todolist");
    }

    function createTask(string memory _content) public {
        taskCount ++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
    }

    function toggleCompleted(uint _taskId) public {
        Task memory _task = tasks[_taskId]; // underscore means its a local variable- just a convention in solidity. And _task is of type Task
        _task.completed = !_task.completed;
        tasks[_taskId] = _task;
        emit TaskCompleted(_taskId, _task.completed);
    }
}