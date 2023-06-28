/*
  Warnings:

  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "Role" AS ENUM ('user', 'mentor', 'censor', 'manager', 'admin');

-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "Account" (
    "accountID" TEXT NOT NULL,
    "account" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Account_pkey" PRIMARY KEY ("accountID")
);

-- CreateTable
CREATE TABLE "UserInfo" (
    "userID" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "email" TEXT,
    "phoneNumber" TEXT,
    "country" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'user',
    "accountID" TEXT NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "UserInfo_pkey" PRIMARY KEY ("userID")
);

-- CreateTable
CREATE TABLE "Post" (
    "postID" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "userInfoUserID" TEXT,
    "like" DECIMAL(65,30) NOT NULL DEFAULT 0,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Post_pkey" PRIMARY KEY ("postID")
);

-- CreateTable
CREATE TABLE "Star" (
    "starID" TEXT NOT NULL,
    "userInfoUserID" TEXT NOT NULL,
    "point" DECIMAL(65,30) NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Star_pkey" PRIMARY KEY ("starID")
);

-- CreateTable
CREATE TABLE "Comment" (
    "commentID" TEXT NOT NULL,
    "userInfoUserID" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "postPostID" TEXT,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Comment_pkey" PRIMARY KEY ("commentID")
);

-- CreateIndex
CREATE UNIQUE INDEX "Account_account_key" ON "Account"("account");

-- AddForeignKey
ALTER TABLE "UserInfo" ADD CONSTRAINT "UserInfo_accountID_fkey" FOREIGN KEY ("accountID") REFERENCES "Account"("accountID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_userInfoUserID_fkey" FOREIGN KEY ("userInfoUserID") REFERENCES "UserInfo"("userID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Star" ADD CONSTRAINT "Star_userInfoUserID_fkey" FOREIGN KEY ("userInfoUserID") REFERENCES "UserInfo"("userID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_userInfoUserID_fkey" FOREIGN KEY ("userInfoUserID") REFERENCES "UserInfo"("userID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_postPostID_fkey" FOREIGN KEY ("postPostID") REFERENCES "Post"("postID") ON DELETE SET NULL ON UPDATE CASCADE;
