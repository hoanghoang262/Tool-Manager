/*
  Warnings:

  - You are about to drop the column `userInfoID` on the `Account` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Account" DROP CONSTRAINT "Account_userInfoID_fkey";

-- DropIndex
DROP INDEX "Account_userInfoID_key";

-- AlterTable
ALTER TABLE "Account" DROP COLUMN "userInfoID";

-- AddForeignKey
ALTER TABLE "UserInfo" ADD CONSTRAINT "UserInfo_accountID_fkey" FOREIGN KEY ("accountID") REFERENCES "Account"("accountID") ON DELETE RESTRICT ON UPDATE CASCADE;
