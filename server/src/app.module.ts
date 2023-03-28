import { Module } from '@nestjs/common';
import { AuthModule } from './auth/auth.module';
import { UserModule } from './user/user.module';
import { PrismaModule } from './prisma/prisma.module';
import { TaskModule } from './task/task.module';

/**
 * This is main module of nest project it will init first and call it childrens
 */
@Module({
  imports: [AuthModule, UserModule, PrismaModule, TaskModule],
  providers: [],
})
export class AppModule {}
