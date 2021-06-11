const TodoList = artifacts.require('./TodoList.sol')

contract('TodoList', (accounts) => {
    before(async () =>{
        this.todoList = await TodoList.deployed()
    })

    it('deploys successfully', async () =>{
        const address =await this.todoList.address

        assert.notEqual(address, 0x0)
        assert.notEqual(address, '')
        assert.notEqual(address, null)
        assert.notEqual(address, undefined)
    })

    it('list tasks', async () =>{
        const taskCount = await this.todoList.taskCount()
        const task = await this.todoList.tasks(taskCount)

        assert.equal(task.id.toNumber(), taskCount.toNumber())
        assert.equal(task.content, 'Check out my fabulous todolist')
        assert.equal(task.completed, false)
        assert.equal(taskCount.toNumber(), 1)
    })

    it('creates tasks', async () => {
        const result = await this.todoList.createTask('A new task boy')
        const taskCount = await this.todoList.taskCount()
        assert.equal(taskCount.toNumber(), 2)
        // Log result to checkout create task's transaction details
        console.log('Create Tasks test Result: ', result)
        const event = result.logs[0].args
        assert.equal(event.id.toNumber(), 2)
        assert.equal(event.content, 'A new task boy')
        assert.equal(event.completed, false)
        
    })

})