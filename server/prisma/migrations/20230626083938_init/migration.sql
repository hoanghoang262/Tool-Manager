/*
  Warnings:

  - You are about to drop the column `postPostID` on the `Comment` table. All the data in the column will be lost.
  - You are about to drop the column `userInfoUserID` on the `Comment` table. All the data in the column will be lost.
  - You are about to drop the column `userInfoUserID` on the `Post` table. All the data in the column will be lost.
  - You are about to drop the column `postPostID` on the `Star` table. All the data in the column will be lost.
  - You are about to drop the column `userInfoUserID` on the `Star` table. All the data in the column will be lost.
  - Added the required column `userInfoID` to the `Comment` table without a default value. This is not possible if the table is not empty.
  - Added the required column `postID` to the `Star` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userInfoID` to the `Star` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_postPostID_fkey";

-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_userInfoUserID_fkey";

-- DropForeignKey
ALTER TABLE "Post" DROP CONSTRAINT "Post_userInfoUserID_fkey";

-- DropForeignKey
ALTER TABLE "Star" DROP CONSTRAINT "Star_postPostID_fkey";

-- DropForeignKey
ALTER TABLE "Star" DROP CONSTRAINT "Star_userInfoUserID_fkey";

-- AlterTable
ALTER TABLE "Comment" DROP COLUMN "postPostID",
DROP COLUMN "userInfoUserID",
ADD COLUMN     "postID" TEXT,
ADD COLUMN     "userInfoID" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Post" DROP COLUMN "userInfoUserID",
ADD COLUMN     "userInfoID" TEXT;

-- AlterTable
ALTER TABLE "Star" DROP COLUMN "postPostID",
DROP COLUMN "userInfoUserID",
ADD COLUMN     "postID" TEXT NOT NULL,
ADD COLUMN     "userInfoID" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "UserInfo" ADD COLUMN     "courseCourseID" TEXT,
ADD COLUMN     "mentorClassID" TEXT,
ADD COLUMN     "studentClassID" TEXT;

-- CreateTable
CREATE TABLE "LearningCategory" (
    "learningCategoryID" TEXT NOT NULL,
    "learningCategoryName" TEXT NOT NULL,
    "learningCategoryDescription" TEXT NOT NULL,

    CONSTRAINT "LearningCategory_pkey" PRIMARY KEY ("learningCategoryID")
);

-- CreateTable
CREATE TABLE "Class" (
    "classID" TEXT NOT NULL,
    "briefDescription" TEXT NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3) NOT NULL,
    "totalHours" DOUBLE PRECISION NOT NULL,
    "learningCategoryID" TEXT NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Class_pkey" PRIMARY KEY ("classID")
);

-- CreateTable
CREATE TABLE "Course" (
    "courseID" TEXT NOT NULL,
    "learningCategoryID" TEXT NOT NULL,
    "briefDescription" TEXT NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3) NOT NULL,
    "totalHours" DOUBLE PRECISION NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Course_pkey" PRIMARY KEY ("courseID")
);

-- CreateTable
CREATE TABLE "Document" (
    "documentID" TEXT NOT NULL,
    "userInfoID" TEXT,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Document_pkey" PRIMARY KEY ("documentID")
);

-- AddForeignKey
ALTER TABLE "UserInfo" ADD CONSTRAINT "UserInfo_mentorClassID_fkey" FOREIGN KEY ("mentorClassID") REFERENCES "Class"("classID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserInfo" ADD CONSTRAINT "UserInfo_studentClassID_fkey" FOREIGN KEY ("studentClassID") REFERENCES "Class"("classID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserInfo" ADD CONSTRAINT "UserInfo_courseCourseID_fkey" FOREIGN KEY ("courseCourseID") REFERENCES "Course"("courseID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_userInfoID_fkey" FOREIGN KEY ("userInfoID") REFERENCES "UserInfo"("userID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Star" ADD CONSTRAINT "Star_userInfoID_fkey" FOREIGN KEY ("userInfoID") REFERENCES "UserInfo"("userID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Star" ADD CONSTRAINT "Star_postID_fkey" FOREIGN KEY ("postID") REFERENCES "Post"("postID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_userInfoID_fkey" FOREIGN KEY ("userInfoID") REFERENCES "UserInfo"("userID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_postID_fkey" FOREIGN KEY ("postID") REFERENCES "Post"("postID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Class" ADD CONSTRAINT "Class_learningCategoryID_fkey" FOREIGN KEY ("learningCategoryID") REFERENCES "LearningCategory"("learningCategoryID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Course" ADD CONSTRAINT "Course_learningCategoryID_fkey" FOREIGN KEY ("learningCategoryID") REFERENCES "LearningCategory"("learningCategoryID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Document" ADD CONSTRAINT "Document_userInfoID_fkey" FOREIGN KEY ("userInfoID") REFERENCES "UserInfo"("userID") ON DELETE SET NULL ON UPDATE CASCADE;
