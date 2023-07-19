/*
  Warnings:

  - You are about to drop the column `documentDocumentID` on the `Image` table. All the data in the column will be lost.
  - The primary key for the `UserInfo` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `userID` on the `UserInfo` table. All the data in the column will be lost.
  - You are about to drop the column `documentDocumentID` on the `Video` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[userInfoID]` on the table `Account` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `userInfoID` to the `Account` table without a default value. This is not possible if the table is not empty.
  - The required column `userInfoID` was added to the `UserInfo` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

*/
-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_userInfoID_fkey";

-- DropForeignKey
ALTER TABLE "Document" DROP CONSTRAINT "Document_userInfoID_fkey";

-- DropForeignKey
ALTER TABLE "Image" DROP CONSTRAINT "Image_documentDocumentID_fkey";

-- DropForeignKey
ALTER TABLE "Post" DROP CONSTRAINT "Post_userInfoID_fkey";

-- DropForeignKey
ALTER TABLE "QAPost" DROP CONSTRAINT "QAPost_userInfoID_fkey";

-- DropForeignKey
ALTER TABLE "Star" DROP CONSTRAINT "Star_userInfoID_fkey";

-- DropForeignKey
ALTER TABLE "UserInfo" DROP CONSTRAINT "UserInfo_accountID_fkey";

-- DropForeignKey
ALTER TABLE "Video" DROP CONSTRAINT "Video_documentDocumentID_fkey";

-- AlterTable
ALTER TABLE "Account" ADD COLUMN     "userInfoID" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Image" DROP COLUMN "documentDocumentID";

-- AlterTable
ALTER TABLE "UserInfo" DROP CONSTRAINT "UserInfo_pkey",
DROP COLUMN "userID",
ADD COLUMN     "userInfoID" TEXT NOT NULL,
ADD CONSTRAINT "UserInfo_pkey" PRIMARY KEY ("userInfoID");

-- AlterTable
ALTER TABLE "Video" DROP COLUMN "documentDocumentID";

-- CreateIndex
CREATE UNIQUE INDEX "Account_userInfoID_key" ON "Account"("userInfoID");

-- AddForeignKey
ALTER TABLE "Account" ADD CONSTRAINT "Account_userInfoID_fkey" FOREIGN KEY ("userInfoID") REFERENCES "UserInfo"("userInfoID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_userInfoID_fkey" FOREIGN KEY ("userInfoID") REFERENCES "UserInfo"("userInfoID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Star" ADD CONSTRAINT "Star_userInfoID_fkey" FOREIGN KEY ("userInfoID") REFERENCES "UserInfo"("userInfoID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_userInfoID_fkey" FOREIGN KEY ("userInfoID") REFERENCES "UserInfo"("userInfoID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "QAPost" ADD CONSTRAINT "QAPost_userInfoID_fkey" FOREIGN KEY ("userInfoID") REFERENCES "UserInfo"("userInfoID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Document" ADD CONSTRAINT "Document_userInfoID_fkey" FOREIGN KEY ("userInfoID") REFERENCES "UserInfo"("userInfoID") ON DELETE SET NULL ON UPDATE CASCADE;
