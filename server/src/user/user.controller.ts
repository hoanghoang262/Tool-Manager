import {
  Controller,
  Get,
  Param,
  Post,
  Body,
  BadRequestException,
  Put,
  Delete,
} from '@nestjs/common';
import { UserInfo, Prisma } from '@prisma/client';
import { UserService } from './user.service';

@Controller('user')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @Get(':id')
  getUserById(@Param('id') id: string): Promise<UserInfo> {
    return this.userService.user({ userInfoID: id });
  }

  @Get()
  getAllTasks(): Promise<UserInfo[]> {
    return this.userService.getAllUserInfo({});
  }

  @Post('')
  createUser(
    @Body() userInfoData: Prisma.UserInfoCreateInput,
  ): Promise<UserInfo> {
    console.log(userInfoData);
    if (!userInfoData) {
      setTimeout(() => {
        throw new BadRequestException('Data not send');
      }, 200);
    }
    return this.userService.createUser(userInfoData);
  }

  @Put(':id')
  UpdateUserInfo(
    @Param('id') id: string,
    @Body() data: Prisma.UserInfoUpdateInput,
  ): Promise<UserInfo> {
    const userInfoWhereUniqueInput: Prisma.UserInfoWhereUniqueInput = {
      userInfoID: id,
    };
    return this.userService.updateUserInfo({
      where: userInfoWhereUniqueInput,
      data: data,
    });
  }

  @Delete(':id')
  DeleteTask(@Param('id') id: string): Promise<UserInfo> {
    const userInfoWhereUniqueInput: Prisma.UserInfoWhereUniqueInput = {
      userInfoID: id,
    };
    return this.userService.deleteUserInfo(userInfoWhereUniqueInput);
  }
}
