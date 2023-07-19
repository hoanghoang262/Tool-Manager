import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { Prisma, UserInfo } from '@prisma/client';

@Injectable()
export class UserService {
  constructor(private prisma: PrismaService) {}

  async user(
    userWhereUniqueInput: Prisma.UserInfoWhereUniqueInput,
  ): Promise<UserInfo | null> {
    return this.prisma.userInfo.findUnique({
      where: userWhereUniqueInput,
    });
  }

  async getAllUserInfo(param: {
    skip?: number;
    take?: number;
    cursor?: Prisma.UserInfoWhereUniqueInput;
    where?: Prisma.UserInfoWhereInput;
    orderBy?: Prisma.UserInfoOrderByWithAggregationInput;
  }): Promise<UserInfo[]> {
    const { skip, take, cursor, where, orderBy } = param;
    return this.prisma.userInfo.findMany({
      skip,
      take,
      cursor,
      where,
      orderBy,
    });
  }

  async createUser(data: Prisma.UserInfoCreateInput): Promise<UserInfo> {
    return this.prisma.userInfo.create({ data });
  }

  async updateUserInfo(params: {
    where: Prisma.UserInfoWhereUniqueInput;
    data: Prisma.UserInfoUpdateInput;
  }): Promise<UserInfo> {
    const { where, data } = params;
    return this.prisma.userInfo.update({
      data,
      where,
    });
  }

  async deleteUserInfo(
    where: Prisma.UserInfoWhereUniqueInput,
  ): Promise<UserInfo> {
    return this.prisma.userInfo.delete({ where });
  }
}
