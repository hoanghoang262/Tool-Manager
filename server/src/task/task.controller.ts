import {
  BadRequestException,
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Put,
} from '@nestjs/common';
import { Prisma, Task } from '@prisma/client';
import { TaskService } from './task.service';

@Controller('task')
export class TaskController {
  constructor(private readonly taskService: TaskService) {}

  //SECTION - Basic CRUD controller for 'task' table
  /**FUNCTION - getTask(id)
   * Retrieves a task with the specified ID
   */
  @Get(':id')
  getTask(@Param('id') id: string): Promise<Task | null> {
    return this.taskService.getTask({ id: id });
  }

  /**FUNCTION - getAllTasks()
   *Retrieves all task list
   */
  @Get()
  getAllTasks(): Promise<Task[]> {
    return this.taskService.getAllTask({});
  }

  /**FUNCTION -  -CreateTask(data)
   *Create a task from data receive and add it in Task take
   */
  @Post()
  CreateTask(@Body() data: Prisma.TaskCreateInput): Promise<Task> {
    if (!data) {
      throw new BadRequestException('Data not sent');
    }
    if (!data.name || !data.subject || !data.requirement) {
      throw new BadRequestException(
        'Name,subject and requirement are required',
      );
    }
    return this.taskService.createTask(data);
  }

  /**FUNCTION - UpdateTask(id,data)
   *Update a task info from it (param)id and receive (body)data
   */
  @Put(':id')
  UpdateTask(
    @Param('id') id: string,
    @Body() data: Prisma.TaskUpdateInput,
  ): Promise<Task> {
    const taskWhereUniqueInput: Prisma.TaskWhereUniqueInput = {
      id: id,
    };
    return this.taskService.updateTask({
      where: taskWhereUniqueInput,
      data: data,
    });
  }

  /**FUNCTION - Delete(id)
   *Delete a task from table by it ID
   */
  @Delete(':id')
  DeleteTask(@Param('id') id: string): Promise<Task> {
    const taskWhereUniqueInput: Prisma.TaskWhereUniqueInput = {
      id: id,
    };
    return this.taskService.deleteTask(taskWhereUniqueInput);
  }
  //%SECTION
}
