import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { Prisma, Course } from '@prisma/client';

@Injectable()
export class CourseService {
  constructor(private prisma: PrismaService) {}

  async getCourseById(
    courseWhereUniqueInput: Prisma.CourseWhereUniqueInput,
  ): Promise<Course | null> {
    return this.prisma.course.findUnique({
      where: courseWhereUniqueInput,
    });
  }

  async getAllCourse(param: {
    skip?: number;
    take?: number;
    cursor?: Prisma.CourseWhereUniqueInput;
    where?: Prisma.CourseWhereInput;
    orderBy?: Prisma.CourseOrderByWithAggregationInput;
  }): Promise<Course[]> {
    const { skip, take, cursor, where, orderBy } = param;
    return this.prisma.course.findMany({
      skip,
      take,
      cursor,
      where,
      orderBy,
    });
  }

  async createCourse(data: Prisma.CourseCreateInput): Promise<Course> {
    return this.prisma.course.create({ data });
  }

  async updateCourse(params: {
    where: Prisma.CourseWhereUniqueInput;
    data: Prisma.CourseUpdateInput;
  }): Promise<Course> {
    const { where, data } = params;
    return this.prisma.course.update({
      data,
      where,
    });
  }

  async deleteCourse(where: Prisma.CourseWhereUniqueInput): Promise<Course> {
    return this.prisma.course.delete({ where });
  }
}
