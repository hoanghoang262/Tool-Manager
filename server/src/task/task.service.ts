import { Injectable } from '@nestjs/common';
import { Prisma, Task } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class TaskService {
  constructor(private prisma: PrismaService) {}
  //SECTION - TASK table: List of Api Funtions for basic CRUD
  /**FUNCTION - getTask()
   * Retrieves a single task from the database that matches the given unique identifier.
   * @param {Prisma.TaskWhereUniqueInput} taskWhereUniqueInput - The unique identifier of the task to retrieve.
   * @returns {Promise<Task | null>} A Promise that resolves to the task object if found, or null if no task is found.
   */
  async getTask(
    taskWhereUniqueInput: Prisma.TaskWhereUniqueInput,
  ): Promise<Task | null> {
    return this.prisma.task.findUnique({
      where: taskWhereUniqueInput,
    });
  }

  /**FUNCTION - getAllTask()
   * Retrieves a list of tasks from the database that match the specified criteria.
   * @param {Object} param - An object that specifies the search criteria for the tasks.
   * @param {number} [param.skip] - The number of tasks to skip (for pagination).
   * @param {number} [param.take] - The maximum number of tasks to return.
   * @param {Prisma.TaskWhereUniqueInput} [param.cursor] - A unique identifier used for pagination (e.g. to retrieve the next page of results).
   * @param {Prisma.TaskWhereInput} [param.where] - An object that specifies the search criteria for the tasks (e.g. to filter by status or assignee).
   * @param {Prisma.TaskOrderByWithAggregationInput} [param.orderBy] - An object that specifies the sorting order for the tasks provide by prisma.
   * @returns {Promise<Task[]>} A Promise that resolves to an array of task objects that match the specified criteria.
   */
  async getAllTask(param: {
    skip?: number;
    take?: number;
    cursor?: Prisma.TaskWhereUniqueInput;
    where?: Prisma.TaskWhereInput;
    orderBy?: Prisma.TaskOrderByWithAggregationInput;
  }): Promise<Task[]> {
    const { skip, take, cursor, where, orderBy } = param;
    return this.prisma.task.findMany({
      skip,
      take,
      cursor,
      where,
      orderBy,
    });
  }

  /**FUNCTION - createTask(data)
   * Create a task from data receive and add it in Task take
   * @param {Prisma.TaskCreateInput} data - The data type to create the task create by prisma contain all task attribute.
   * @returns {Promise<Task>} A Promise that resolves to the data of created task.
   */
  async createTask(data: Prisma.TaskCreateInput): Promise<Task> {
    return this.prisma.task.create({ data });
  }

  /**FUNCTION - updateTask(where,data)
   * Update Task data and returns a Promise that resolves to the updated task.
   * @param {Object} params - An object containing the where and data parameters for the update operation.
   * @param {Prisma.TaskWhereUniqueInput} params.where - The unique identifier for the task to update.
   * @param {Prisma.TaskUpdateInput} params.data - The data to update the task with.
   * @returns {Promise<Task>} A Promise that resolves to the updated task.
   */
  async updateTask(params: {
    where: Prisma.TaskWhereUniqueInput;
    data: Prisma.TaskUpdateInput;
  }): Promise<Task> {
    const { where, data } = params;
    return this.prisma.task.update({
      data,
      where,
    });
  }

  /**FUNCTION - deleteTask
   * Delete task and returns a Promise that resolves to the delete task.
   * @param {Prisma.TaskWhereUniqueInput} where - The unique identifier for the task to delete.
   * @returns {Promise<Task>} A Promise that resolves to the delete task.
   */
  async deleteTask(where: Prisma.TaskWhereUniqueInput): Promise<Task> {
    return this.prisma.task.delete({ where });
  }
  //%SECTION
  //SECTION - Task until
  //%SECTION
}
