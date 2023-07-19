import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { Prisma, Account } from '@prisma/client';

@Injectable()
export class AuthService {
  constructor(private prisma: PrismaService) {}

  async auth(
    accountWhereUniqueInput: Prisma.AccountWhereUniqueInput,
  ): Promise<Account | null> {
    return this.prisma.account.findUnique({
      where: accountWhereUniqueInput,
    });
  }

  async signIn(account: Account): Promise<Account | null> {
    return this.prisma.account.findFirst({
      where: {
        account: account.account,
        password: account.password,
      },
      include: {
        UserInfo: true,
      },
    });
  }

  async getAllAccount(param: {
    skip?: number;
    take?: number;
    cursor?: Prisma.AccountWhereUniqueInput;
    where?: Prisma.AccountWhereInput;
    orderBy?: Prisma.AccountOrderByWithAggregationInput;
  }): Promise<Account[]> {
    const { skip, take, cursor, where, orderBy } = param;
    return this.prisma.account.findMany({
      skip,
      take,
      cursor,
      where,
      orderBy,
    });
  }

  async createAccount(data: Prisma.AccountCreateInput): Promise<Account> {
    return this.prisma.account.create({ data });
  }

  async updateAccount(params: {
    where: Prisma.AccountWhereUniqueInput;
    data: Prisma.AccountUpdateInput;
  }): Promise<Account> {
    const { where, data } = params;
    return this.prisma.account.update({
      data,
      where,
    });
  }

  async deleteAccount(where: Prisma.AccountWhereUniqueInput): Promise<Account> {
    return this.prisma.account.delete({ where });
  }
}
