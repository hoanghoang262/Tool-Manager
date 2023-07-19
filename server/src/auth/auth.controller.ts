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
import { Account, Prisma } from '@prisma/client';
import { AuthService } from './auth.service';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Get(':id')
  getAccountById(@Param('id') id: string): Promise<Account> {
    return this.authService.auth({ userInfoID: id });
  }

  @Get()
  getAllAuth(): Promise<Account[]> {
    return this.authService.getAllAccount({});
  }

  @Post('confirm')
  async signIn(@Body() account: Account): Promise<Account | null> {
    return this.authService.signIn(account);
  }

  @Post('')
  createUser(@Body() accountData: Prisma.AccountCreateInput): Promise<Account> {
    if (!accountData) {
      setTimeout(() => {
        throw new BadRequestException('Data not send');
      }, 200);
    }
    return this.authService.createAccount(accountData);
  }

  @Put(':id')
  UpdateUserInfo(
    @Param('id') id: string,
    @Body() data: Prisma.AccountUpdateInput,
  ): Promise<Account> {
    const accountWhereUniqueInput: Prisma.AccountWhereUniqueInput = {
      userInfoID: id,
    };
    return this.authService.updateAccount({
      where: accountWhereUniqueInput,
      data: data,
    });
  }

  @Delete(':id')
  DeleteTask(@Param('id') id: string): Promise<Account> {
    const accountWhereUniqueInput: Prisma.AccountWhereUniqueInput = {
      userInfoID: id,
    };
    return this.authService.deleteAccount(accountWhereUniqueInput);
  }
}
