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
import { CourseService } from './course.service';
import { Course, Prisma } from '@prisma/client';

@Controller('course')
export class CourseController {
  constructor(private readonly courseService: CourseService) {}

  @Get()
  getAllCourse(): Promise<Course[]> {
    return this.courseService.getAllCourse({});
  }

  @Get(':id')
  getCourseById(@Param('id') id: string): Promise<Course> {
    return this.courseService.getCourseById({ courseID: id });
  }

  @Post('')
  createUser(@Body() courseData: Prisma.CourseCreateInput): Promise<Course> {
    if (!courseData) {
      setTimeout(() => {
        throw new BadRequestException('Data not send');
      }, 200);
    }
    return this.courseService.createCourse(courseData);
  }

  @Put(':id')
  UpdateCourse(
    @Param('id') id: string,
    @Body() data: Prisma.CourseUpdateInput,
  ): Promise<Course> {
    const CourseWhereUniqueInput: Prisma.CourseWhereUniqueInput = {
      courseID: id,
    };
    return this.courseService.updateCourse({
      where: CourseWhereUniqueInput,
      data: data,
    });
  }

  @Delete(':id')
  DeleteTask(@Param('id') id: string): Promise<Course> {
    const courseWhereUniqueInput: Prisma.CourseWhereUniqueInput = {
      courseID: id,
    };
    return this.courseService.deleteCourse(courseWhereUniqueInput);
  }
}
