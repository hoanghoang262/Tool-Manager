/*
  Warnings:

  - Added the required column `name` to the `Course` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('male', 'female', 'other');

-- AlterTable
ALTER TABLE "Course" ADD COLUMN     "name" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "UserInfo" ADD COLUMN     "gender" "Gender";
