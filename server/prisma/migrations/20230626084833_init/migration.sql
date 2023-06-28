/*
  Warnings:

  - You are about to drop the column `courseCourseID` on the `UserInfo` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "UserInfo" DROP CONSTRAINT "UserInfo_courseCourseID_fkey";

-- AlterTable
ALTER TABLE "UserInfo" DROP COLUMN "courseCourseID",
ADD COLUMN     "courseID" TEXT;

-- AddForeignKey
ALTER TABLE "UserInfo" ADD CONSTRAINT "UserInfo_courseID_fkey" FOREIGN KEY ("courseID") REFERENCES "Course"("courseID") ON DELETE SET NULL ON UPDATE CASCADE;
