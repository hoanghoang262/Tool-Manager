/*
  Warnings:

  - You are about to drop the column `account` on the `Account` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[userInfoID]` on the table `Account` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `userInfoID` to the `Account` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "UserInfo" DROP CONSTRAINT "UserInfo_accountID_fkey";

-- DropIndex
DROP INDEX "Account_account_key";

-- AlterTable
ALTER TABLE "Account" DROP COLUMN "account",
ADD COLUMN     "userInfoID" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Account_userInfoID_key" ON "Account"("userInfoID");

-- AddForeignKey
ALTER TABLE "Account" ADD CONSTRAINT "Account_userInfoID_fkey" FOREIGN KEY ("userInfoID") REFERENCES "UserInfo"("userInfoID") ON DELETE RESTRICT ON UPDATE CASCADE;
